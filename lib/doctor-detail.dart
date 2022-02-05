import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class DoctorDetail extends StatefulWidget {
  //const DoctorDetail({ Key? key }) : super(key: key);
int? id;
String? name;
String? email;
int? age;
String? address;
String? path;
String? qualifications;
String? phone_number;
DoctorDetail({this.id,this.name,this.email,this.address,this.age,this.path,this.phone_number,this.qualifications});
  @override
  _DoctorDetailState createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
      body:Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+widget.path!)),
  
             ),
                 SizedBox(height: 15,),
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
                     leading: Icon(Icons.calculate
                     ,color: Colors.teal,
                     ),
                     title: Text(widget.age.toString()),
                     ),
                   ),
                   ),
           
          ],
        ),
      ) ,

    );
  }
}