/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/admin-profile.dart';
import 'package:project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({ Key? key }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
   Future<List<Admin>>getAdmin() async {
    final String _url='http://192.168.73.189:8000/api/getAdmin';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
List<Admin> users=[];
for(var u in jsonData){
  Admin user=new Admin(u['id'],u['name'],u['email'],u['role_id'],u['address'],u['age'],u['qualifications'],u['phone_number']);
  users.add(user);
}
print(users.length);
print(users.toString());
return users;
  }
  Future<List<Doctor>>getDoctors() async {
    final String _url='http://192.168.73.189:8000/api/getdoctors';
var response=await http.get(Uri.parse(_url));
var jsonDatae=jsonDecode(response.body);
var m=jsonDatae.length;

print('///////////////////');
//print(jsonDatae);
List<Doctor> doctors=[];
for(int o=0;o<2;o++){
for(var u in jsonDatae){
  Doctor user=new Doctor(u[o]['id'],u[o]['name'],u[o]['email'],u[o]['role_id'],u[o]['age'],u[o]['address'],u[o]['phone_number'],u[o]['qualifications']);
  doctors.add(user);
}
}

print(doctors.length);
return doctors;
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
  title: Text('admin'),
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
               Container(
           margin: EdgeInsets.only(top: 10),
           child: CircleAvatar(
             radius: 90,
             backgroundImage: AssetImage('images/doctor.jpg'),
           )
         ),
         SizedBox(height: 7,),
             FutureBuilder(
                future: getAdmin(),
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
return ListTile(
title: Container(
  margin: EdgeInsets.only(left: 90),
  child: 
Text(snapshot.data[i].name,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),
subtitle: Container(
  margin: EdgeInsets.only(left: 40),
  child: Text(snapshot.data[i].email,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),
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
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.person),
             ),
             InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.sick),
             ),
             Container(
               margin: EdgeInsets.only(left: 90),
               child: Text('all patients',style: TextStyle(fontSize: 17),)),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.local_hospital)
             ),
             Container(
               margin: EdgeInsets.only(left: 90),
               child: Text('all doctor',style: TextStyle(fontSize: 17),)),
           ],
         )
          
           ],
           ),
     ),
body: Container(child: Card(
        child: FutureBuilder(
          future: getDoctors(),
          builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return ListView.builder(
  itemCount: snapshot.data.length,
  itemBuilder: (context,i){
    var m=snapshot.data[i].name;
    print(m);
return ListTile(
title: Text(snapshot.data[i].name),
subtitle: Text(snapshot.data[i].email),
);
  }
  );

       }
        ),
      ),),
    );
  }
}
class Admin{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone;
  Admin(this.id,this.name,this.email,this.role_id,this.address,this.age,this.qualificatios,this.phone);
}
class Doctor{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone;
  Doctor(this.id,this.name,this.email,this.role_id,this.age,this.address,this.phone,this.qualificatios);
}*/
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/admin-profile.dart';
import 'package:project/doctor-detail.dart';
import 'package:project/login.dart';
import 'package:project/patient-for-admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({ Key? key }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
   Future<List<Admin>>getAdmin() async {
    final String _url='http://192.168.73.189:8000/api/getAdmin';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
List<Admin> users=[];
for(var u in jsonData){
  Admin user=new Admin(u['id'],u['name'],u['email'],u['role_id'],u['address'],u['age'],u['qualifications'],u['phone_number'],u['path']);
  users.add(user);
}
print(users.length);
print(users.toString());
return users;
  }
  Future<List<Doctor>>getDoctors() async {
    final String _url='http://192.168.73.189:8000/api/getdoctors';
var response=await http.get(Uri.parse(_url));
var jsonDatae=jsonDecode(response.body);
var m=jsonDatae.length;

print('///////////////////');
//print(jsonDatae);
List<Doctor> doctors=[];
for(int o=0;o<4;o++){
for(var u in jsonDatae){
  Doctor user=new Doctor(u[o]['id'],u[o]['name'],u[o]['email'],u[o]['role_id'],u[o]['age'],u[o]['address'],u[o]['phone_number'],u[o]['qualifications'],u[o]['path']);
  doctors.add(user);
}
}

print(doctors.length);
return doctors;
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
  title: Text('admin'),
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
                future: getAdmin(),
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
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
  
             //SizedBox(height: 9,),
  
             Container(
  
              margin: EdgeInsets.only(left: 30),
  
    child: 
  
  Text(snapshot.data[i].name,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)
  
             ),
  
             SizedBox(height: 9,),
  
             Container(
  
    margin: EdgeInsets.only(left: 40),
  
    child: Text(snapshot.data[i].email,style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),
  
  
  
           
  
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
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.person),
             ),
             InkWell(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminProfile()));
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.sick),
             ),
             Container(
               margin: EdgeInsets.only(left: 90),
               child: InkWell(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientForAdmin()));
                print('hi');
                 },
                 child: Text('all patients',style: TextStyle(fontSize: 17),))),
           ],
         ),
          SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.local_hospital)
             ),
             InkWell(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('all doctor',style: TextStyle(fontSize: 17),)),
             ),
           ],
         )
          
           ],
           ),
     ),
body: Container(child: Card(
        child: FutureBuilder(
          future: getDoctors(),
          builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return ListView.builder(
 
  itemCount: snapshot.data.length,
  itemBuilder: (context,i){
    var id=snapshot.data[i].id;
    var name=snapshot.data[i].name;
     var email=snapshot.data[i].email;
      var age=snapshot.data[i].age;
       var address=snapshot.data[i].address;
        var path=snapshot.data[i].path;
         var qualificatios=snapshot.data[i].qualificatios;
        var phone_number=snapshot.data[i].phone;
return Column(
children: [
  //title: Text(snapshot.data[i].name),
  Card(
          child: Row(
            children: [
        Container(
          margin: EdgeInsets.only(top: 15,bottom: 15),
          child:  CircleAvatar(
                  radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data[i].path)
                  
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
                child: Text('heart specelized',style: TextStyle(wordSpacing: 4,fontWeight: FontWeight.w500),),
                margin: EdgeInsets.only(left: 50),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: TextButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
               id: id,name: name,email: email,address: address,age: age,qualifications: qualificatios,path: path,phone_number: phone_number,
             )));
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
);
  }
  );

       }
        ),
      ),),
    );
  }
}
class Admin{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone,path;
  Admin(this.id,this.name,this.email,this.role_id,this.address,this.age,this.qualificatios,this.phone,this.path);
}
class Doctor{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone,path;
  Doctor(this.id,this.name,this.email,this.role_id,this.age,this.address,this.phone,this.qualificatios,this.path);
}
/*
trailing: Container(
  width: 80,
  child: CachedNetworkImage(imageUrl: 'http://192.168.73.189:8000/uploads/'+snapshot.data[i].path,)),
  */