import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/admin-home.dart';
class AddDoctor extends StatefulWidget {
  const AddDoctor({ Key? key }) : super(key: key);

  @override
  _AddDoctorState createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController namecontroller=TextEditingController();
   TextEditingController agecontroller=TextEditingController();
   TextEditingController passwordcontroller=TextEditingController();
   TextEditingController addresscontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
   TextEditingController qualificationscontroller=TextEditingController();
    TextEditingController role_idcontroller=TextEditingController();
     TextEditingController phone_numbercontroller=TextEditingController();
     GlobalKey<FormState> _formkey=GlobalKey<FormState>();
     PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  maxLength: 20,
                  validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
                    controller: namecontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'name'
                    ),
                  ),
                   SizedBox(height: 10,),
                  TextFormField(
                                    validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
  maxLength: 20,
  keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'email'
                    ),
                  ),
                  SizedBox(height: 15,),
                   SizedBox(height: 10,),
                  TextFormField(
  maxLength: 20,
                  validator:(text){
    if(text!.isEmpty){
return "ادخل هذا الحقل";
    }
return null;
  },
  keyboardType: TextInputType.number,
                    controller: role_idcontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'role-id'
                    ),
                  ),
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
                   controller: qualificationscontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'qualifications'
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
                   controller: phone_numbercontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'phone_number'
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
                   controller: passwordcontroller,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      hintText: 'password'
                    ),
                  ),
                  SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        fixedSize: Size(200,50)
                      ),
                    child: Text('add doctor',style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,fontSize: 17),),
                    onPressed: ()async{
                     var formdata=_formkey.currentState;
    if(formdata!.validate()){
                       if(_imageFile != null){
                  var imageResponse=await patchImage(_imageFile!.path);
                 
                  if(imageResponse.statusCode==200){
                    print('//////////////////////////');
                    print('success');
           showDialog(context: context, builder:(context){
return AlertDialog(
  actions: [
    TextButton(onPressed: (){
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHome()));
    },
     child: Text('OK')
     )
  ],
  title: Text('Success',style: TextStyle(color: Colors.green),),
  
  content: Text('The doctor added successfully'),
);
             });
                   
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
 var url='http://192.168.2.189:8000/api/register';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.files.add(await http.MultipartFile.fromPath("path",filepath));
 request.fields.addAll({
'name':namecontroller.text,
'age':agecontroller.text,
'address':addresscontroller.text,
'qualifications':qualificationscontroller.text,
'email':emailcontroller.text,
'password':passwordcontroller.text,
'phone_number':phone_numbercontroller.text,
'role_id':role_idcontroller.text,
 });
// request.fields['name']=nam
 request.headers.addAll({
   'Content-type':'multipart/form-data'
 });
var response=request.send();
return response;
}
}