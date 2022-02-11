/*import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/registrar-home.dart';
class AddPatient extends StatefulWidget {
  const AddPatient({ Key? key }) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  // PickedFile? _imageFile;
 // final ImagePicker _picker=ImagePicker();
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
 int? i;
 Object? selecteddoctor='noon yasir';
  TextEditingController namecontroller=TextEditingController();
   TextEditingController agecontroller=TextEditingController();
   TextEditingController diagnosiscontroller=TextEditingController();
   TextEditingController addresscontroller=TextEditingController();
  TextEditingController patient_phone_numbercontroller=TextEditingController();
   TextEditingController patient_companion_phone_numbercontroller=TextEditingController();

    PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
 /* _register()async{
      var data={
'name':namecontroller.text,
      'email':emailcontroller.text,
      'password':passwordcontroller.text,
      'about':aboutcontroller.text,
      };
      var res=await CallApi2().postData2(data,'adddoctor');
      var body= json.decode(res.body);
      if(body['success'] ?? true){
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateHome()));
       print('/////////////////////////////////////////////////');
       print(body);
      }else{
        return Text('fail');
      }
    }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Add Patients'),
  centerTitle: true,
  backgroundColor: Colors.teal[300],
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                children: [
                  imageProfile(),
                  SizedBox(height: 10,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
  maxLength: 20,
                    controller: namecontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'name'
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
     keyboardType:TextInputType.number ,
                    controller: agecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'age'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
                    controller: addresscontroller,
                    decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'address'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                    validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
    maxLines: 10,
                   controller: diagnosiscontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'diagnosis'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.length < 10){
return "رقم الهاتف اقل من 10";
    }
    if(text.length > 10){
return "رقم الهاتف اكبر من 10";
    }
return null;
  },
    keyboardType: TextInputType.phone,
                   controller: patient_phone_numbercontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'patient_phone_number'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.length < 10){
return "رقم الهاتف اقل من 10";
    }
    if(text.length > 10){
return "رقم الهاتف اكبر من 10";
    }
return null;
  },
    keyboardType: TextInputType.phone,
                   controller: patient_companion_phone_numbercontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'patient_companion_phone_number'
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
child: Text('select doctor:',style: TextStyle(fontWeight: FontWeight.bold),),

                      ),
                      SizedBox(width: 20,),
                      DropdownButton(
                        
                        items: ['husam omer','mhmud mohamed','sara ahmed','noon yasir'].map((e) => DropdownMenuItem(child: Text('$e'),value: e,)
               ).toList(),
               onChanged: (val){
                 setState(() {
                       selecteddoctor=val;
                       switch(selecteddoctor){
                         case 'husam omer':
                         {
                           print(selecteddoctor);
                           i=3;
                           print(i);
                       break;
                         }
                          case 'mhmud mohamed':
                         {
                            print(selecteddoctor);
                            i=4;
                           print(i);
                           break;
                         }
                          case 'sara ahmed':
                         {
                           i=5;
                           print(i);
                            print(selecteddoctor);
                            break;
                         }
                          case 'noon yasir':
                         {
                           i=6;
                           print(i);
                            print(selecteddoctor);
                         }
                       }
                 });
               },
               value: selecteddoctor,
               ),
                    ],
                  ),
                  SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        fixedSize: Size(200,50)
                      ),
                    child: Text('add patient',style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,fontSize: 17),),
                    onPressed: ()async{
                      // _register();
                      var formdata=_formkey.currentState;
    if(formdata!.validate()){
                       if(_imageFile != null){
                  var imageResponse=await patchImage(_imageFile!.path);
                 
                  if(imageResponse.statusCode==200){
                    print('//////////////////////////');
                    print('success');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrarHome()));
                  }
      
                }else{
                  print('//////////////////////////');
                  print('fail');
                }
                    }else{
                      print('enter failed');
                    }
                    },
                  )
                ],
              ))
            ],
          ),
        ),
      ) ,
    );
  }
  Widget imageProfile(){
  return Center(
    child: Stack(children: [
  CircleAvatar(radius: 80,
  backgroundImage: _imageFile == null ?  AssetImage('images/doctor.jpg'): FileImage(File(_imageFile!.path)) as ImageProvider,
  ),
  Positioned(child: InkWell(
    onTap: (){
showModalBottomSheet(context:context,
 builder:((builder)=>bottomsheet()),);
    },
    child: Icon(Icons.camera_alt)),
  bottom: 20.0,
  right: 20.0,
  )
    ],),
  );
}
Widget bottomsheet(){
  return Container(
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20
    ),
child: Column(children: [
  Text('choose photo'),
  SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    FlatButton.icon(onPressed: (){
      takePhoto(ImageSource.camera);
    },
     icon: Icon(Icons.camera), 
     label: Text('camera')),
     FlatButton.icon(onPressed: (){
       takePhoto(ImageSource.gallery);
     },
     icon: Icon(Icons.image), 
     label: Text('gallery')),
  ],)
],),
  );
}
void takePhoto(ImageSource source)async{
  final pickedFile=await _picker.getImage(source: source);
  setState(() {
    _imageFile=pickedFile;
  });
}

Future<http.StreamedResponse> patchImage(String filepath)async{
 var url='http://192.168.73.189:8000/api/addpatient';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.files.add(await http.MultipartFile.fromPath("path",filepath));
 request.fields.addAll({
'name':namecontroller.text,
'age':agecontroller.text,
'address':addresscontroller.text,
'diagnosis':diagnosiscontroller.text,
'patient_phone_number':patient_phone_numbercontroller.text,
'patient_companion_phone_number':patient_companion_phone_numbercontroller.text,
'person_id':i.toString()
 });
// request.fields['name']=nam
 request.headers.addAll({
   'Content-type':'multipart/form-data'
 });
var response=request.send();
return response;
}
}*/
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/registrar-home.dart';
class AddPatient extends StatefulWidget {
  const AddPatient({ Key? key }) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  // PickedFile? _imageFile;
 // final ImagePicker _picker=ImagePicker();
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey=new GlobalKey<ScaffoldState>();
 int? i;
 Object? selecteddoctor='noon yasir';
  TextEditingController namecontroller=TextEditingController();
   TextEditingController agecontroller=TextEditingController();
   TextEditingController diagnosiscontroller=TextEditingController();
   TextEditingController addresscontroller=TextEditingController();
  TextEditingController patient_phone_numbercontroller=TextEditingController();
   TextEditingController patient_companion_phone_numbercontroller=TextEditingController();

    PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
 /* _register()async{
      var data={
'name':namecontroller.text,
      'email':emailcontroller.text,
      'password':passwordcontroller.text,
      'about':aboutcontroller.text,
      };
      var res=await CallApi2().postData2(data,'adddoctor');
      var body= json.decode(res.body);
      if(body['success'] ?? true){
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateHome()));
       print('/////////////////////////////////////////////////');
       print(body);
      }else{
        return Text('fail');
      }
    }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
         title: Text('Add Patients'),
  centerTitle: true,
  backgroundColor: Colors.teal[300],
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                children: [
                  imageProfile(),
                  SizedBox(height: 10,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
  maxLength: 20,
                    controller: namecontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'name'
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
     keyboardType:TextInputType.number ,
                    controller: agecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'age'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
                    controller: addresscontroller,
                    decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'address'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                    validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
    maxLines: 10,
                   controller: diagnosiscontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'diagnosis'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.length < 10){
return "رقم الهاتف اقل من 10";
    }
    if(text.length > 10){
return "رقم الهاتف اكبر من 10";
    }
return null;
  },
    keyboardType: TextInputType.phone,
                   controller: patient_phone_numbercontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'patient_phone_number'
                    ),
                  ),
                   SizedBox(height: 15,),
                  TextFormField(
                     validator:(text){
    if(text!.length < 10){
return "رقم الهاتف اقل من 10";
    }
    if(text.length > 10){
return "رقم الهاتف اكبر من 10";
    }
return null;
  },
    keyboardType: TextInputType.phone,
                   controller: patient_companion_phone_numbercontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'patient_companion_phone_number'
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
child: Text('select doctor:',style: TextStyle(fontWeight: FontWeight.bold),),

                      ),
                      SizedBox(width: 20,),
                      DropdownButton(
                        
                        items: ['husam omer','mhmud mohamed','sara ahmed','noon yasir'].map((e) => DropdownMenuItem(child: Text('$e'),value: e,)
               ).toList(),
               onChanged: (val){
                 setState(() {
                       selecteddoctor=val;
                       switch(selecteddoctor){
                         case 'husam omer':
                         {
                           print(selecteddoctor);
                           i=3;
                           print(i);
                       break;
                         }
                          case 'mhmud mohamed':
                         {
                            print(selecteddoctor);
                            i=4;
                           print(i);
                           break;
                         }
                          case 'sara ahmed':
                         {
                           i=5;
                           print(i);
                            print(selecteddoctor);
                            break;
                         }
                          case 'noon yasir':
                         {
                           i=6;
                           print(i);
                            print(selecteddoctor);
                         }
                       }
                 });
               },
               value: selecteddoctor,
               ),
                    ],
                  ),
                  SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        fixedSize: Size(200,50)
                      ),
                    child: Text('add patient',style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,fontSize: 17),),
                    onPressed: ()async{
                      // _register();
                      var formdata=_formkey.currentState;
    if(formdata!.validate()){
                       if(_imageFile != null){
                  var imageResponse=await patchImage(_imageFile!.path);
                 
                  if(imageResponse.statusCode==200){
                    print('//////////////////////////');
                    print('success');
            var snackbar=SnackBar(content: Text('The patient added successfully'),duration: Duration(seconds: 10),);
                    scaffoldkey.currentState!.showSnackBar(snackbar);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrarHome()));
                  }
      
                }else{
             showDialog(context: context, builder:(context){
return AlertDialog(
  title: Text('Warning',style: TextStyle(color: Colors.red),),
  
  content: Text('Please enter the image'),
);
             });
                }
                    }else{
                      print('enter failed');
                    }
                    },
                  )
                ],
              ))
            ],
          ),
        ),
      ) ,
    );
  }
  Widget imageProfile(){
  return Center(
    child: Stack(children: [
  CircleAvatar(radius: 80,
  backgroundImage: _imageFile == null ?  AssetImage('images/doctor.jpg'): FileImage(File(_imageFile!.path)) as ImageProvider,
  ),
  Positioned(child: InkWell(
    onTap: (){
showModalBottomSheet(context:context,
 builder:((builder)=>bottomsheet()),);
    },
    child: Icon(Icons.camera_alt)),
  bottom: 20.0,
  right: 20.0,
  )
    ],),
  );
}
Widget bottomsheet(){
  return Container(
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20
    ),
child: Column(children: [
  Text('choose photo'),
  SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    FlatButton.icon(onPressed: (){
      takePhoto(ImageSource.camera);
    },
     icon: Icon(Icons.camera), 
     label: Text('camera')),
     FlatButton.icon(onPressed: (){
       takePhoto(ImageSource.gallery);
     },
     icon: Icon(Icons.image), 
     label: Text('gallery')),
  ],)
],),
  );
}
void takePhoto(ImageSource source)async{
  final pickedFile=await _picker.getImage(source: source);
  setState(() {
    _imageFile=pickedFile;
  });
}

Future<http.StreamedResponse> patchImage(String filepath)async{
 var url='http://192.168.2.189:8000/api/addpatient';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.files.add(await http.MultipartFile.fromPath("path",filepath));
 request.fields.addAll({
'name':namecontroller.text,
'age':agecontroller.text,
'address':addresscontroller.text,
'diagnosis':diagnosiscontroller.text,
'patient_phone_number':patient_phone_numbercontroller.text,
'patient_companion_phone_number':patient_companion_phone_numbercontroller.text,
'person_id':i.toString()
 });
// request.fields['name']=nam
 request.headers.addAll({
   'Content-type':'multipart/form-data'
 });
var response=request.send();
return response;
}
Future<http.StreamedResponse> add()async{
  var g=AssetImage('images/doctor.jpg');
 var url='http://192.168.2.189:8000/api/addpatient';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.files.add(await http.MultipartFile.fromPath("path",'1643707328.jpg'));
 request.fields.addAll({
'name':namecontroller.text,
'age':agecontroller.text,
'address':addresscontroller.text,
'diagnosis':diagnosiscontroller.text,
'patient_phone_number':patient_phone_numbercontroller.text,
'patient_companion_phone_number':patient_companion_phone_numbercontroller.text,
'person_id':i.toString()
 });
// request.fields['name']=nam
 request.headers.addAll({
   'Content-type':'multipart/form-data'
 });
var response=request.send();
return response;
}
}