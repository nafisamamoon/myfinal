import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/doctor-home.dart';
class EditDio extends StatefulWidget {
  //const EditDio({ Key? key }) : super(key: key);
  int? id;
String? diagnosis;
EditDio({this.diagnosis});
  @override
  _EditDioState createState() => _EditDioState();
}

class _EditDioState extends State<EditDio> {
  final TextEditingController _diagnosiscontroller=new TextEditingController();
  String userId='';
  void initState() {

    super.initState();

   setState(() {
     userId=widget.id.toString();
       _diagnosiscontroller.text=widget.diagnosis!;
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
                  TextFormField(
                    maxLines: 10,
                    controller: _diagnosiscontroller,
                     decoration: InputDecoration(
                         labelText: 'Diagnosis',
                      hintText: 'diagnosis',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                    SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed:(){
                   editDiagnosis();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorHome()));
                    },
                    child: Text('Edit',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    )
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
 editDiagnosis()async{
    var diagnosis=_diagnosiscontroller.text;
    if(diagnosis.isNotEmpty){
var url='http://192.168.73.189:8000/api/updatedio/$userId';
var bodyData=json.encode({
'diagnosis':diagnosis,
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
  var mesage=json.decode(response.body);
  print(mesage);
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