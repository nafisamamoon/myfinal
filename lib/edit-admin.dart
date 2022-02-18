import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/admin-profile.dart';
class EditAdmin extends StatefulWidget {
  //const EditAdmin({ Key? key }) : super(key: key);
int? id,age;
String? name,path,address,qual,phone;
EditAdmin({this.id,this.address,this.age,this.name,this.path,this.qual,this.phone});
  @override
  _EditAdminState createState() => _EditAdminState();
}

class _EditAdminState extends State<EditAdmin> {
   TextEditingController _age=TextEditingController();
  TextEditingController _name=TextEditingController();
  TextEditingController _address=TextEditingController();
  TextEditingController _qualifications=TextEditingController();
  TextEditingController _phone_number=TextEditingController();
  String uid='';
  PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
   @override
  void initState() {
    uid=widget.id.toString();
    _name.text=widget.name!;
    _age.text=widget.age.toString();
    _address.text=widget.address!;
    _qualifications.text=widget.qual!;
    _phone_number.text=widget.phone!;
   // _imageFile=widget.path as PickedFile?;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
      imageProfile(),
       SizedBox(height: 15,),
              Container(
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'Name',
                    hintText: 'name'
                  ),
                ),
              ),
              SizedBox(height: 15,),
               Container(
                 child: TextFormField(
                   keyboardType: TextInputType.number,
                  controller: _age,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'Age',
                    hintText: 'age'
                  ),
              ),
               ),
                SizedBox(height: 15,),
              Container(
                child: TextFormField(
                  controller: _address,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'Address',
                    hintText: 'address'
                  ),
                ),
              ),
            
              SizedBox(height: 15,),
             Container(
               child: TextFormField(
                 maxLines:10,
                  controller: _qualifications,
                  decoration: InputDecoration(
                    
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'qualifications',
                    hintText: 'qualification'
                  ),
                ),
             ),
                 SizedBox(height: 15,),
             Container(
               child: TextFormField(
                 keyboardType: TextInputType.number,
                  controller: _phone_number,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    labelText: 'phone number',
                    hintText: 'phone'
                  ),
                ),
             ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: ()async{
                //print(_imageFile!.path);
                 if(_imageFile != null){
        var imageResponse=await patchImage();
                   
                    if(imageResponse.statusCode==200){
                      print('//////////////////////////');
                      print('success');
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
                       showDialog(context: context, builder:(context){
return AlertDialog(
  actions: [
    TextButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
    },
     child: Text('OK')
     )
  ],
  title: Text('Success',style: TextStyle(color: Colors.green),),
  
  content: Text('The admin edited successfully'),
);
             });
                    }
        
                  else{
                    print('//////////////////////////');
                    print('fail');
                  }
                 }else{
                   edit();
                 }
              }
              , child: Text('Edit',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
              style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      fixedSize: Size(250, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
              ),
                SizedBox(height: 22,),
  
      /////////////////////////////
  
       ElevatedButton(
                    onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
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
          ),
        ),
      ),
    );
  }
   Widget imageProfile(){
  return Center(
    child: Stack(children: [
  CircleAvatar(radius: 80,
  backgroundImage: _imageFile == null ?  CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+widget.path!): FileImage(File(_imageFile!.path)) as ImageProvider,
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
Future<http.StreamedResponse> patchImage()async{
  
 var url='http://192.168.2.189:8000/api/edit-all/$uid';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.files.add(await http.MultipartFile.fromPath("path",_imageFile!.path));
 //request.files.add(await http.MultipartFile.fromPath("path",_imageFile== null?CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+widget.path!) as String  :_imageFile!.path) );
//request.files.add(await http.MultipartFile.fromPath("path",_imageFile== null?'http://192.168.2.189:8000/uploads/'+widget.path! :_imageFile!.path) );
 request.fields.addAll({
'name':_name.text,
'age':_age.text,
'address':_address.text,
'qualifications':_qualifications.text,
'phone_number':_phone_number.text,
//'phone_number':_phone_number.text,
 '_method': 'PUT'
 });
// request.fields['name']=nam
 request.headers.addAll({
   //'Content-type':'multipart/form-data',
   //'Accept': 'application/json'
     'Content-Type': 'application/json',
  'Accept': 'application/json'
 });
var response=await request.send();
return response;
}
 Future<http.StreamedResponse> edit()async{
 var url='http://192.168.2.189:8000/api/edit-data/$uid';
 var request=http.MultipartRequest('POST',Uri.parse(url));
 request.fields.addAll({
'name':_name.text,
'age':_age.text,
'address':_address.text,
'qualifications':_qualifications.text,
'phone_number':_phone_number.text,
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
  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
  showDialog(context: context, builder:(context){
return AlertDialog(
  actions: [
    TextButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
    },
     child: Text('OK')
     )
  ],
  title: Text('Success',style: TextStyle(color: Colors.green),),
  
  content: Text('The admin edited successfully'),
);
             });
}
else{
  print('fail');
}
return response;
}
}