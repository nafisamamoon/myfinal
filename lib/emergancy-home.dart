import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/emergancy-profile.dart';
import 'package:project/login.dart';
import 'package:project/one-patient-emergency.dart';
import 'package:project/search-emergency.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class EmergancyHome extends StatefulWidget {
  const EmergancyHome({ Key? key }) : super(key: key);

  @override
  _EmergancyHomeState createState() => _EmergancyHomeState();
}

class _EmergancyHomeState extends State<EmergancyHome> {
  Future<List<Patient>>getPatient() async {
    final String _url='http://192.168.2.189:8000/api/allpatient';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
List<Patient> users=[];
for(var u in jsonData){
 Patient user=new Patient(u['id'],u['name'],u['diagnosis'],u['patient_phone_number'],u['address'],u['age'],u['patient_companion_phone_number'],u['path']);
  users.add(user);
}
print(users.length);
print(users.toString());
return users;
  }
   Future<List<Emergancy>>getEmergancy() async {
    final String _url='http://192.168.2.189:8000/api/getEmergancy';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
print('////////////////////////////////');
print(jsonData);
List<Emergancy> users=[];
for(var u in jsonData){
  Emergancy user=new Emergancy(u['id'],u['name'],u['email'],u['role_id'],u['address'],u['age'],u['qualifications'],u['phone_number'],u['path']);
  users.add(user);
}
print(users.length);
print(users.toString());
return users;
  }
  save(String token) async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=token;
  pref.setString(Key,ValueKey);
}
 
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
     appBar: AppBar(
  centerTitle: true,
  backgroundColor: Colors.teal,
  title: Text('All Patient'),
  actions: [
         
       IconButton(onPressed: (){
         save('0');
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
       }, icon: Icon(Icons.logout))
      ],),
     
       drawer: Drawer(
       child: ListView(children: [
         Container(
           color: Colors.teal,
           child: Column(
             children: [
             FutureBuilder(
                future: getEmergancy(),
          builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return 
ListView.builder(
  shrinkWrap: true,
  itemCount: snapshot.data.length,
  itemBuilder: (context,i){
    var name=snapshot.data[i].name;
return Container(
  margin: EdgeInsets.only(bottom: 10),
  child:   Column(
  
    
  
  children: [
  
     Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
  
             //SizedBox(height: 9,),
  
             Container(
  
              margin: EdgeInsets.only(left: 30),
  
    child: 
  
  Text(snapshot.data[i].name,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)
  
             ),
  
             SizedBox(height: 9,),
  
            /* Container(
  
    margin: EdgeInsets.only(left: 40),
  
    child: Text(snapshot.data[i].email,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),*/
  
  
  
           
  
  ],
  
  ),
);
  }
  );

       }
             ),
             ],
           ),
         ),
         SizedBox(height: 19,),
         Row(
           children: [
             Container(
             //  margin: EdgeInsets.only(left: 15),
             margin: EdgeInsets.only(left: 60),
child: Icon(Icons.person,color: Colors.teal,),
             ),
              SizedBox(width: 40,),
             InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmergancyProfile()));
               },
               child: Container(
               //  margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
             //  margin: EdgeInsets.only(left: 15),
             margin: EdgeInsets.only(left: 60),
child: Icon(Icons.sick,color: Colors.teal,),
             ),
              SizedBox(width: 40,),
             InkWell(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child: Container(
               //  margin: EdgeInsets.only(left: 90),
                 child: Text('All patients',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
             //  margin: EdgeInsets.only(left: 15),
             margin: EdgeInsets.only(left: 60),
child: Icon(Icons.search,color: Colors.teal,),
             ),
              SizedBox(width: 40,),
             InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchEmergency()));
               },
               child: Container(
               //  margin: EdgeInsets.only(left: 90),
                 child: Text('Search for patient',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
           ],
           ),
     ),
    body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future:getPatient() ,
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.data ==null)
{
  return Container(child: Center(child: CircularProgressIndicator(),
  ),
  );
} else return Expanded(
  child:   ListView.builder(
  
  
  
    shrinkWrap: true,
  
  
  
    itemCount: snapshot.data.length,
  
  
  
    itemBuilder: (context,i){
  
  
  
  return SingleChildScrollView(
  
    child:   Column(
  
    

    children: [
  
  
      //title: Text(snapshot.data[i].name),
  
      Card(
  
              child: Row(
  
  
                children: [
  
            Container(
  
              margin: EdgeInsets.only(top: 15,bottom: 15),
  
              child:  CircleAvatar(
  
                      radius: 90,
  
                  backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data[i].path)

                    ),

  
            ),
  

              Expanded(
  
  
                child: Column(

                children: [

  
                  Container(child: Text(snapshot.data[i].name,style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,

  
                  fontSize: 20
  
         ),),
  
  
                  margin: EdgeInsets.only(left: 70),
  
  
                  //padding: EdgeInsets.only(top: 20),

                  ),
                  Container(
            child:Text(snapshot.data[i].address,style: TextStyle(wordSpacing: 2, fontSize: 15
  
         ),),
  
  
                  margin: EdgeInsets.only(left: 70), 
                  ),
  
                  Container(
  
  
                    margin: EdgeInsets.only(left: 50),
  
                    child: TextButton(

                 onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnePatientEmergency(id:snapshot.data[i].id)));
                 },
  
                   child: Text('more information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
  
                   style: TextButton.styleFrom(
  

                     primary: Colors.white,

                backgroundColor: Colors.teal,
  
                textStyle: TextStyle(
  
      wordSpacing: 2
  
   ),
  
  
                elevation: 6,
  
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))

  
                   ),

                   ),
    
  
                  ),
  
                ],
  
  
                  ),
  
    
              ),
  
     ],
  
              ),

            ),
  
    ],
  
      ),
  
  );
  
  
    }

  
    ),
);
              }
              )
          ],
        ),
      ),
    );
  }
}
class Emergancy{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone,path;
  Emergancy(this.id,this.name,this.email,this.role_id,this.address,this.age,this.qualificatios,this.phone,this.path);
}
class Patient{
  final int id,age;
  final String name,address,diagnosis,patient_phone_number,path,patient_companion_phone_number;
  Patient(this.id,this.name,this.diagnosis,this.patient_phone_number,this.address,this.age,this.patient_companion_phone_number,this.path);
}