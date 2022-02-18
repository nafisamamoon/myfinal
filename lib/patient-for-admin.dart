import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/admin-home.dart';
import 'package:project/one-patient-admin.dart';
import 'package:project/one-patient.dart';
class PatientForAdmin extends StatefulWidget {
  const PatientForAdmin({ Key? key }) : super(key: key);

  @override
  _PatientForAdminState createState() => _PatientForAdminState();
}

class _PatientForAdminState extends State<PatientForAdmin> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:   Container(
        child: Column(
          children: [
            FutureBuilder(
              future:getPatient() ,
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.data ==null)
{
  return Container(child: Center(child:CircularProgressIndicator(),
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
  
  
                    margin: EdgeInsets.only(left: 50),
  
                    child: TextButton(

                 onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OnePatientAdmin(id:snapshot.data[i].id)));
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
              ),

            SizedBox(height: 22,),
  
      /////////////////////////////
  
       ElevatedButton(
                    onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHome()));
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
      ),
    );
  }
}
class Patient{
  final int id,age;
  final String name,address,diagnosis,patient_phone_number,path,patient_companion_phone_number;
  Patient(this.id,this.name,this.diagnosis,this.patient_phone_number,this.address,this.age,this.patient_companion_phone_number,this.path);
}