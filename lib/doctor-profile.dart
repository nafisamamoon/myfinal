import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class DoctorProfile extends StatefulWidget {
  //const DoctorProfile({ Key? key }) : super(key: key);
String? name;
String? email;
int? age;
String? address;
String? path;
String? qualifications;
String? phone_number;
DoctorProfile({this.name,this.email,this.age,this.address,this.path,this.qualifications,this.phone_number});
 
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
  
}

class _DoctorProfileState extends State<DoctorProfile> {
  
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
            
                 margin: EdgeInsets.only(top: 10),
            
                 child: CircleAvatar(
            
                   radius: 90,
            
                   backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+widget.path!)),
            
                 ),
                 SizedBox(height: 15,),
                        /*   Container(
            
            margin: EdgeInsets.only(right: 340),
            
            child: Text('Name',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
            
                ),*/
            
               
            
                Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.person
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.name!),
                     ),
                   ),
                   ),
            
                        
            
                   SizedBox(height: 12,),
            
                 Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.email
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.email!),
                     ),
                   ),
                   ),
              SizedBox(height: 15,),
                       
            
                   SizedBox(height: 12,),
            
            Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.calculate
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.age.toString()),
                     ),
                   ),
                   ),
             
                          
            
                   SizedBox(height: 12,),
            
                 Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.home
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.address!),
                     ),
                   ),
                   ),
            
            
                   SizedBox(height: 12,),
            
                 Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.phone
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.phone_number!),
                     ),
                   ),
                   ),
              SizedBox(height: 15,),
                Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.description
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.qualifications!),
                     ),
                   ),
                   ),
                      SizedBox(height: 22,),
            
                /////////////////////////////
            
                 ElevatedButton(
                        onPressed:(){
                         
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
            ),
          ),
        ),
      ),
    );
  }
}