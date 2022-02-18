import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/pat-detail.dart';
import 'package:project/registrar-home.dart';
class EditPatient extends StatefulWidget {
  //const EditPatient({ Key? key }) : super(key: key);
int? age,id;
String? name,address,diagnosis,patient_phone_number,patient_companion_phone_number;
EditPatient({this.id,this.name,this.age,this.address,this.diagnosis,this.patient_companion_phone_number,this.patient_phone_number});
  @override
  _EditPatientState createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  final TextEditingController _namecontroller=new TextEditingController();
  final TextEditingController _agecontroller=new TextEditingController();
  final TextEditingController _addresscontroller=new TextEditingController();
  //final TextEditingController _diagnosiscontroller=new TextEditingController();
  final TextEditingController _patient_phone_numbercontroller=new TextEditingController();
  final TextEditingController _patient_companion_phone_numbercontroller=new TextEditingController();
  String userId='';
  @override
  void initState() {
    print('//////////////////////////////');
    print(widget.id);
     print(widget.name);
      print(widget.address);
       print(widget.age);
        print(widget.patient_phone_number);
         print(widget.patient_companion_phone_number);
          print(widget.diagnosis);
    super.initState();

   setState(() {
     userId=widget.id.toString();
      _namecontroller.text=widget.name!;
     _agecontroller.text=widget.age.toString();
      _addresscontroller.text=widget.address!;
      // _diagnosiscontroller.text=widget.diagnosis!;
        _patient_phone_numbercontroller.text=widget.patient_phone_number!;
         _patient_companion_phone_numbercontroller.text=widget.patient_companion_phone_number!;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  
                  TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      labelText: 'Name',
                       labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'name',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                   TextFormField(
                      keyboardType:TextInputType.number ,
                    controller: _agecontroller,
                     decoration: InputDecoration(
                         labelText: 'Age',
                          labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'age',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                  TextFormField(
                    controller: _addresscontroller,
                     decoration: InputDecoration(
                         labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'address',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                 /* TextFormField(
                    maxLines: 10,
                    controller: _diagnosiscontroller,
                     decoration: InputDecoration(
                         labelText: 'Diagnosis',
                          labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'diagnosis',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),*/
                    SizedBox(height: 15,),
                  TextFormField(
                     keyboardType:TextInputType.number ,
                    controller: _patient_phone_numbercontroller,
                     decoration: InputDecoration(
                         labelText: 'patient_phone_number',
                          labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'patient_phone_number',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                  TextFormField(
                     keyboardType:TextInputType.number ,
                    controller: _patient_companion_phone_numbercontroller,
                     decoration: InputDecoration(
                       labelText: 'patient_companion_phone_number',
                       labelStyle: TextStyle(color: Colors.teal,fontSize: 20),
                      hintText: 'patient_companion_phone_number',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
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
    editUser()async{
    var fullname=_namecontroller.text;
    var age=_agecontroller.text;
    var address=_addresscontroller.text;
    var patient_phone_number=_patient_phone_numbercontroller.text;
    var patient_companion_phone_number=_patient_companion_phone_numbercontroller.text;
    //var diagnosis=_diagnosiscontroller.text;
    if(fullname.isNotEmpty && age.isNotEmpty && address.isNotEmpty && patient_phone_number.isNotEmpty && patient_companion_phone_number.isNotEmpty){
var url='http://192.168.2.189:8000/api/updatepatient/$userId';
var bodyData=json.encode({
'name':fullname,
'age':age,
'address':address,
//'diagnosis':diagnosis,
'patient_phone_number':patient_phone_number,
'patient_companion_phone_number':patient_companion_phone_number
});
var response=await http.put(
  Uri.parse(url),
  headers: {
    "Content-Type":"application/json",
    "Accept":"application/json"
  },
  body:bodyData
);
try{
if(response.statusCode == 200){
  //var mesage=json.decode(response.body);
  //print(mesage);
  showDialog(context: context, builder:(context){
return AlertDialog(
  actions: [
    TextButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
    },
     child: Text('OK')
     )
  ],
  title: Text('Success',style: TextStyle(color: Colors.green),),
  
  content: Text('The patient edited successfully'),
);
             });
}else
{
  print('fail');
}
}catch(e){
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
print(e);
}
    }
  }
}