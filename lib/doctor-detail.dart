import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/admin-home.dart';
import 'package:project/edit-doctor.dart';
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
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
        
               margin: EdgeInsets.only(top: 10),
        
               child: CircleAvatar(
        
                 radius: 90,
        
                 backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+widget.path!)),
        
               ),
                   SizedBox(height: 15,),
               Container(
                      
                     child: Card(
                       child: ListTile(
                       leading: Icon(Icons.person
                       ,color: Colors.teal,
                       ),
                        title:Text('Name',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.name!,style: TextStyle(color: Colors.black)),
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
                        title:Text('Phone number',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.phone_number!,style: TextStyle(color: Colors.black)),
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
                        title:Text('Qualifications',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.qualifications!,style: TextStyle(color: Colors.black)),
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
                        title:Text('E-mail',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.email!,style: TextStyle(color: Colors.black)),
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
                        title:Text('Home address',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.address!,style: TextStyle(color: Colors.black)),
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
                        title:Text('Age',style: TextStyle(color: Colors.grey)),
                       subtitle: Text(widget.age.toString(),style: TextStyle(color: Colors.black)),
                       ),
                     ),
                     ),
             SizedBox(height: 12,),
             ElevatedButton(
                      onPressed:(){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditDoctor(
        id: widget.id,age: widget.age,address: widget.address,name: widget.name,
        path: widget.path,qual: widget.qualifications, phone:widget.phone_number ,                  
                       )));
                      },
                      child: Text('Edit',
                      style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[300],
                        fixedSize: Size(250, 70),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      ),
                      ),
                       SizedBox(height: 12,),
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
                      )
                      
            ],
          ),
        ),
      ) ,

    );
  }
}