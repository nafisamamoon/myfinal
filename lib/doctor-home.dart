import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/doctor-detail.dart';
import 'package:project/doctor-profile.dart';
import 'package:project/login.dart';
import 'package:project/pat-detail.dart';
import 'package:shared_preferences/shared_preferences.dart';


/*class DoctorHome extends StatelessWidget {
  //const DoctorHome({ Key? key }) : super(key: key);
List data;
  int id;
  DoctorHome(this.data,this.id);
  
  save(String token) async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=token;
  pref.setString(Key,ValueKey);
}
Future<Map>getDoctor() async {
    final String _url='http://192.168.73.189:8000/api/doctorinfo/$id';
var response=await http.get(Uri.parse(_url));
Map<String,dynamic> map=jsonDecode(response.body);
//print('=========================');
//print(map);
return map;
  }
  @override
  Widget build(BuildContext context) {
     Future<List<Pat>>getAdmin() async {
    //final String _url='http://192.168.73.189:8000/api/getAdmin';
//var response=await http.get(Uri.parse(_url));
//var jsonData=jsonDecode(response.body);
List<Pat> users=[];
for(var u in data){
  // Pat(this.id,this.name,this.diagnosis,this.patient_phone_number,this.age,this.address,this.patient_companion_phone_number,this.path);
  Pat user=new Pat(u['id'],u['name'],u['diagnosis'],u['patient_phone_number'],u['address'],u['age'],u['patient_companion_phone_number'],u['path']);
  users.add(user);
}
print('=========================');
print(users.length);
print(data);
print('=========================');
return users;
  }
  
  
    return Scaffold(
     
      body:TextButton(onPressed: (){
        getAdmin();
      }, child: Text('j')
      )

    );
  }
}
class Pat{
  final int id,age;
  final String name,address,diagnosis,path,patient_phone_number,patient_companion_phone_number;
  Pat(this.id,this.name,this.diagnosis,this.patient_phone_number,this.age,this.address,this.patient_companion_phone_number,this.path);
}*/

/*
 FutureBuilder(
        future: getAdmin(),
        builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return ListView.builder(

  shrinkWrap: true,
  itemCount: snapshot.data.length,
  itemBuilder:(context,i){
   // print('============================');
    //var id=snapshot.data[i].id;
    //print('============================');
    return Column(
      children: [
        Text(snapshot.data[i].name),
        Text(snapshot.data[i].patient_companion_phone_number)
      ],
    );
  }
  );
          }  )
*/
/////////////////////////////////////////////////////
//  return Text('${data[i]["name"]}');
/*
 Container(
          margin: EdgeInsets.only(top: 15,bottom: 15),
          child:  CircleAvatar(
                  radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+'${data[i]['path']}')
                  
                ),
        ),*/



        
/*import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/doctor-detail.dart';
import 'package:project/doctor-profile.dart';
import 'package:project/login.dart';
import 'package:project/pat-detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DoctorHome extends StatelessWidget {
  //const DoctorHome({ Key? key }) : super(key: key);
List data;
  int id;
  DoctorHome(this.data,this.id);
  
  save(String token) async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=token;
  pref.setString(Key,ValueKey);
}
Future<Map>getDoctor() async {
    final String _url='http://192.168.73.189:8000/api/doctorinfo/$id';
var response=await http.get(Uri.parse(_url));
Map<String,dynamic> map=jsonDecode(response.body);
//print('=========================');
//print(map);
return map;
  }
  @override
  Widget build(BuildContext context) {
    print('=========================');
    print(data);
    print('=========================');
    var myid;
    var name;
    var email;
    var age;
    var address;
    var path;
var qualificatios;
var phone_number;
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.teal,
       actions: [
       IconButton(onPressed: (){
         save('0');
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
       }, icon: Icon(Icons.logout))
      ],),
        drawer: Drawer(
       child: ListView(children: [
             FutureBuilder(
                future: getDoctor(),
          builder: (context,AsyncSnapshot snapshot){
             var id=snapshot.data['id'];
           
    name=snapshot.data['name'];
      email=snapshot.data['email'];
       age=snapshot.data['age'];
        address=snapshot.data['address'];
         path=snapshot.data['path'];
          qualificatios=snapshot.data['qualifications'];
         phone_number=snapshot.data['phone_number'];
           //print('=========================');
               //print(qualificatios);
               // print('=========================');
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return Container(
 color: Colors.teal,
 // margin: EdgeInsets.only(right: 7),
child: Column(
children: [
  //Text(snapshot.data['email']),
  //Text(snapshot.data['name'])
  Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data['path'])),
  
             ),
             Container(
  
              margin: EdgeInsets.only(left: 30),
  
    child: 
  
  Text(snapshot.data['name'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)
  
             ),
               SizedBox(height: 9,),
  
             Container(
  
    margin: EdgeInsets.only(left: 40),
  
    child: Text(snapshot.data['email'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),
],
),
);

       }
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
               /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
                   id: id,name:name,email: email,age: age,address: address,qualifications: qualificatios,path: path,phone_number: phone_number,
                 )));*/
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorProfile(
                   name: name,email: email,age: age,address: address,path: path,qualifications: qualificatios,phone_number: phone_number,
                 )));
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
          
           ],
           ),
     ),
      body: ListView.builder(
        itemCount:data.length ,
        itemBuilder:(context,i){
           myid=data[i]['id'];
           print('myid is $myid');
          return Container(
child: Column(
  children: [
    Card(
      child: Row(
        children: [
          Container(
          margin: EdgeInsets.only(top: 15,bottom: 15),
          child:  CircleAvatar(
                  radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+'${data[i]['path']}')
                  
                ),
        ),
         Expanded(
            child: Column(
            children: [
              Container(child: Text('${data[i]["name"]}',style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,
              fontSize: 20
              ),),
              
              margin: EdgeInsets.only(left: 70),
              //padding: EdgeInsets.only(top: 20),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (conntext)=>PatDetail( id: myid,)));
                 // print('************************');
           //print(myid);
           //print('************************');
           //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
              // id: id,name: name,email: email,address: address,age: age,qualifications: qualificatios,path: path,phone_number: phone_number,
            // )));
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
    )
  ],
),
          );
        }
        ),
    );
  }
}
class Pat{
  final int id,age;
  final String name,address,diagnosis,path,patient_phone_number,patient_companion_phone_number;
  Pat(this.id,this.name,this.diagnosis,this.patient_phone_number,this.age,this.address,this.patient_companion_phone_number,this.path);
}*/
class DoctorHome extends StatefulWidget {
  //const DoctorHome({ Key? key }) : super(key: key);
List data;
  int id;
  DoctorHome(this.data,this.id);
  
 
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
   save(String token) async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=token;
  pref.setString(Key,ValueKey);
}
Future<Map>getDoctor() async {
    final String _url='http://192.168.73.189:8000/api/doctorinfo/${widget.id}';
var response=await http.get(Uri.parse(_url));
Map<String,dynamic> map=jsonDecode(response.body);
//print('=========================');
//print(map);
return map;
  }
  @override
  var  myname;
   var myid;
    var name;
    var email;
    var age;
    var address;
    var path;
var qualificatios;
var phone_number;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.teal,
       actions: [
       IconButton(onPressed: (){
         save('0');
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
       }, icon: Icon(Icons.logout))
      ],),
        drawer: Drawer(
       child: ListView(children: [
             FutureBuilder(
                future: getDoctor(),
          builder: (context,AsyncSnapshot snapshot){
             var id=snapshot.data['id'];
           
    name=snapshot.data['name'];
      email=snapshot.data['email'];
       age=snapshot.data['age'];
        address=snapshot.data['address'];
         path=snapshot.data['path'];
          qualificatios=snapshot.data['qualifications'];
         phone_number=snapshot.data['phone_number'];
           //print('=========================');
               //print(qualificatios);
               // print('=========================');
if(snapshot.data ==null)
{
  return Container(child: Center(child: Text('loadin'),
  ),
  );
}   else return Container(
 color: Colors.teal,
 // margin: EdgeInsets.only(right: 7),
child: Column(
children: [
  //Text(snapshot.data['email']),
  //Text(snapshot.data['name'])
  Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data['path'])),
  
             ),
             Container(
  
              margin: EdgeInsets.only(left: 30),
  
    child: 
  
  Text(snapshot.data['name'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)
  
             ),
               SizedBox(height: 9,),
  
             Container(
  
    margin: EdgeInsets.only(left: 40),
  
    child: Text(snapshot.data['email'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),
   SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.person),
             ),
             InkWell(
               onTap: (){
               /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
                   id: id,name:name,email: email,age: age,address: address,qualifications: qualificatios,path: path,phone_number: phone_number,
                 )));*/
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
                   name: snapshot.data['name'],email:snapshot.data['email'],age: snapshot.data['age'],
                   address: snapshot.data['address'],path: snapshot.data['path'],
                   qualifications: snapshot.data['qualifications'],phone_number: snapshot.data['phone_number'],
                 )));
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),
],
),
);

       }
             ),
             /*  SizedBox(height: 19,),
         Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: 15),
child: Icon(Icons.person),
             ),
             InkWell(
               onTap: (){
               /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
                   id: id,name:name,email: email,age: age,address: address,qualifications: qualificatios,path: path,phone_number: phone_number,
                 )));*/
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorProfile(
                   name: name,email: email,age: age,address: address,path: path,qualifications: qualificatios,phone_number: phone_number,
                 )));
               },
               child: Container(
                 margin: EdgeInsets.only(left: 90),
                 child: Text('profile',style: TextStyle(fontSize: 17),)),
             ),
           ],
         ),*/
          
           ],
           ),
     ),
       body: ListView.builder(
        itemCount:widget.data.length ,
        itemBuilder:(context,i){
           myid=widget.data[i]['id'];
            myname=widget.data[i]['name'];
          // print('myid is $myid');
          return Container(
child: Column(
  children: [
    Card(
      child: Row(
        children: [
          Container(
          margin: EdgeInsets.only(top: 15,bottom: 15),
          child:  CircleAvatar(
                  radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+'${widget.data[i]['path']}')
                  
                ),
        ),
         Expanded(
            child: Column(
            children: [
              Container(child: Text('${widget.data[i]["name"]}',style: TextStyle(wordSpacing: 2,fontWeight: FontWeight.bold,
              fontSize: 20
              ),),
              
              margin: EdgeInsets.only(left: 70),
              //padding: EdgeInsets.only(top: 20),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                
                child: TextButton(
                  
                  onPressed: (){
                   // print('/////////////////////');
                   // print(myid);
                  // print('/////////////////////');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatDetail(
  id:widget.data[i]["id"] ,name: widget.data[i]["name"],age: widget.data[i]["age"],address: widget.data[i]["address"],  
  path: widget.data[i]["path"],patient_phone_number: widget.data[i]["patient_phone_number"],patient_companion_phone_number: widget.data[i]["patient_companion_phone_number"], 
  diagnosis:widget.data[i]["diagnosis"] ,             
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
    )
  ],
),
          );
        }
        ),
    );
  }
}
        