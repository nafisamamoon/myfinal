import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/emergancy-home.dart';
import 'package:project/login.dart';
import 'package:project/pat-detail.dart';
import 'package:project/registrar-home.dart';
class EditPatientEmergency extends StatefulWidget {
  //const EditPatientEmergency({ Key? key }) : super(key: key);
int? id;
String? diagnosis;
EditPatientEmergency({this.id,this.diagnosis});
  @override
  _EditPatientEmergencyState createState() => _EditPatientEmergencyState();
}

class _EditPatientEmergencyState extends State<EditPatientEmergency> {
 
 
  final TextEditingController _diagnosiscontroller=new TextEditingController();
 
  String userId='';
  @override
  void initState() {
    print('//////////////////////////////');
  
    super.initState();

   setState(() {
     userId=widget.id.toString();
    //  _namecontroller.text=widget.name!;
    // _agecontroller.text=widget.age.toString();
     // _addresscontroller.text=widget.address!;
       _diagnosiscontroller.text=widget.diagnosis!;
      //  _patient_phone_numbercontroller.text=widget.patient_phone_number!;
       //  _patient_companion_phone_numbercontroller.text=widget.patient_companion_phone_number!;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  
                
                    SizedBox(height: 15,),
                  
                    SizedBox(height: 15,),
                 
                    SizedBox(height: 15,),
                  TextFormField(
                    maxLines: 10,
                    controller: _diagnosiscontroller,
                     decoration: InputDecoration(
                         labelText: 'Diagnosis',
                          labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'diagnosis',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                
                    SizedBox(height: 15,),
              
                    SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed:(){
                  editUser();
                   //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
                    },
                    child: Text('Edit',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    ),
                    SizedBox(height: 18,),
           ElevatedButton(
                    onPressed:(){
  Navigator.of(context).pop();                  
                    },
                    child: Text('Back',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    ),
                    
                    
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
  Future<http.StreamedResponse> editUser()async{
 var url='http://192.168.2.189:8000/api/edit-patient-by-emergency/$userId';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.fields.addAll({
'diagnosis':_diagnosiscontroller.text,
 '_method': 'PUT'
 });
 request.headers.addAll({
   //'Content-type':'multipart/form-data',
   //'Accept': 'application/json'
     'Content-Type': 'application/json',
  'Accept': 'application/json'
 });
var response=await request.send();
if(response.statusCode == 200){
  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrarProfile()));
    showDialog(context: context, builder:(context){
return AlertDialog(
  actions: [
    TextButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmergancyHome()));
    },
     child: Text('OK')
     )
  ],
  title: Text('Success',style: TextStyle(color: Colors.green),),
  
  content: Text('The patient edited successfully'),
);
             });
}
else{
  print('fail');
}
return response;
}
}