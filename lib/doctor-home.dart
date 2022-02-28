import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/doctor-detail.dart';
import 'package:project/doctor-profile.dart';
import 'package:project/login.dart';
import 'package:project/pat-detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final String _url='http://192.168.2.189:8000/api/doctorinfo/${widget.id}';
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
      title: Text('Your Patients'),
      centerTitle: true,
       actions: [
       IconButton(onPressed: (){
         save('0');
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
       }, icon: Icon(Icons.logout))
      ],),
        drawer:
         Drawer(
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
}   else return Column(
  children: [
        Container(
    
     //color: Colors.teal,
    
      margin: EdgeInsets.only(top: 20),
    
    child: Column(
    
    children: [
    
      //Text(snapshot.data['email']),
    
      //Text(snapshot.data['name'])
    
      Container(
    
      
    
                 margin: EdgeInsets.only(top: 10),
    
      
    
                 child: CircleAvatar(
    
      
    
                   radius: 90,
    
      
    
                   backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data['path'])),
    
      
    
                 ),
    
                 Container(
    
      
    
                  margin: EdgeInsets.only(left: 30),
    
      
    
        child: 
    
      
    
      Text(snapshot.data['name'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)
    
      
    
                 ),
    
                   SizedBox(height: 9,),
    
      
    
                 /*Container(
    
      
    
        margin: EdgeInsets.only(left: 40),
    
      
    
        child: Text(snapshot.data['email'],style: TextStyle(fontSize: 17,wordSpacing: 2,fontWeight: FontWeight.bold),)),*/
    
       SizedBox(height: 19,),
    
            
    
    ],
    
    ),
    
    ),
     Card(
       child: Row(
         
                 children: [
         
                   Container(
         
                     margin: EdgeInsets.only(left: 70),
         
         child: Icon(Icons.person,color: Colors.teal,),
         
                   ),
         SizedBox(width: 40,),
                   InkWell(
         
                     onTap: (){
         
                     /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
         
                         id: id,name:name,email: email,age: age,address: address,qualifications: qualificatios,path: path,phone_number: phone_number,
         
                       )));*/
         
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
         
                         name: snapshot.data['name'],email:snapshot.data['email'],age: snapshot.data['age'],
         
                         address: snapshot.data['address'],path: snapshot.data['path'],
         
                         qualifications: snapshot.data['qualifications'],phone_number: snapshot.data['phone_number'],
         
                         id:snapshot.data['id'] ,
         
                       )));
         
                     },
         
                     child: Container(
         
                       margin: EdgeInsets.only(top: 20),
         
                       child: Text('Profile',style: TextStyle(fontSize: 17),)),
         
                   ),
                   
         
                 ],
         
               ),
     ),
             Card(
               child: Row(
                 
                 children: [
                 
                   Container(
                 
                     margin: EdgeInsets.only(left: 70),
                 
                 child: Icon(Icons.sick,color: Colors.teal,),
                 
                   ),
                 SizedBox(width: 40,),
                   InkWell(
                 
                     onTap: (){
                 
                     /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetail(
                 
                         id: id,name:name,email: email,age: age,address: address,qualifications: qualificatios,path: path,phone_number: phone_number,
                 
                       )));*/
                 
                       Navigator.of(context).pop();
                 
                     },
                 
                     child: Container(
                 
                       margin: EdgeInsets.only(top: 20),
                 
                       child: Text('All patient',style: TextStyle(fontSize: 17),)),
                 
                   ),
                   
                 
                 ],
                 
               ),
             ),
            
  ],
);

       }
             ),
          
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
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+'${widget.data[i]['path']}')
                  
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
               Container(child: Row(children: [
                // Icon(Icons.home,color: Colors.tealAccent,),
                Container(
                  //margin: EdgeInsets.only(left: 50),
                  child:  Text('${widget.data[i]["address"]}',style: TextStyle(wordSpacing: 2,
              fontSize: 20
              ),),)
               ],),
              
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
        