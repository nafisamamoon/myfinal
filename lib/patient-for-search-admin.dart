import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class PatientForSearchAdmin extends StatefulWidget {
  //const PatientForSearchAdmin({ Key? key }) : super(key: key);
int? id;
PatientForSearchAdmin({this.id});
  @override
  _PatientForSearchAdminState createState() => _PatientForSearchAdminState();
}

class _PatientForSearchAdminState extends State<PatientForSearchAdmin> {
   Future<List<Patient>>getOnePatient() async {
    final String _url='http://192.168.2.189:8000/api/onepatient/${widget.id}';
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
  @override
  Widget build(BuildContext context) {
     return Scaffold(
body:  FutureBuilder(
                future: getOnePatient(),
          builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: CircularProgressIndicator(),
  ),
  );
}   else return 
ListView.builder(
  shrinkWrap: true,
  itemCount: snapshot.data.length,
  itemBuilder: (context,i){
    var name=snapshot.data[i].name;
return Container(
  margin: EdgeInsets.only(top: 20),
  child:   Column(
  
    children: [

  
          SizedBox(height:20,),
  
          Column(
  
            children: [
  Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
           
  
               SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.person
                 ,color: Colors.teal,
                 ),
                 title:Text('Name',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].name,style: TextStyle(color: Colors.black)),
                 ),
               ),
               ),

  
   SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.phone
                 ,color: Colors.teal,
                 ),
                 title:Text('Patient_phone_number',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].patient_phone_number,style: TextStyle(color: Colors.black)),
                 ),
               ),
               ),
               SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.phone
                 ,color: Colors.teal,
                 ),
                 title:Text('Patient_companion_phone_number',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].patient_companion_phone_number,style: TextStyle(color: Colors.black)),
                 ),
               ),
               ),
            ],
  
          ),
  
        
  
      ////////////////////////
  
          SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.description
                 ,color: Colors.teal,
                 ),
                 title:Text('Diagnosis',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].diagnosis,style: TextStyle(color: Colors.black)),
                 ),
               ),
               ),
       SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.calculate
                 ,color: Colors.teal,
                 ),
                 title:Text('Age',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].age.toString(),style: TextStyle(color: Colors.black))
                 ),
               ),
               ),
  
         SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.home
                 ,color: Colors.teal,
                 ),
                 title:Text('Home address',style: TextStyle(color: Colors.grey)),
                 subtitle: Text(snapshot.data[i].address,style: TextStyle(color: Colors.black)),
                 ),
               ),
               ),
                    
                      SizedBox(height: 22,),
  
      /////////////////////////////
  
       ElevatedButton(
                    onPressed:(){
                    Navigator.of(context).pop();
                    },
                    child: Text('Back',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    ),
  
    ],
  
  ),
);
  }
  );

       }
             ),
    );
  }
}
class Patient{
  final int id,age;
  final String name,address,diagnosis,patient_phone_number,path,patient_companion_phone_number;
  Patient(this.id,this.name,this.diagnosis,this.patient_phone_number,this.address,this.age,this.patient_companion_phone_number,this.path);
}