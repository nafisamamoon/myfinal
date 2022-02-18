import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/edit-emergency.dart';
import 'package:project/emergancy-home.dart';
class EmergancyProfile extends StatefulWidget {
  const EmergancyProfile({ Key? key }) : super(key: key);

  @override
  _EmergancyProfileState createState() => _EmergancyProfileState();
}

class _EmergancyProfileState extends State<EmergancyProfile> {
  Future<List<Emergancy>>getEmergancy() async {
    final String _url='http://192.168.2.189:8000/api/getEmergancy';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
print('................................');
print(jsonData);
List<Emergancy> users=[];
for(var u in jsonData){
  Emergancy user=new Emergancy(u['id'],u['name'],u['email'],u['role_id'],u['address'],u['age'],u['qualifications'],u['phone_number'],u['path']);
  users.add(user);
}
print(users.length);
print(users.toString());
return users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  FutureBuilder(
                future: getEmergancy(),
          builder: (context,AsyncSnapshot snapshot){
if(snapshot.data ==null)
{
  return Container(child: Center(child: CircularProgressIndicator(),
  ),
  );
}   else return 
ListView.builder(
  shrinkWrap: true,
  itemCount: snapshot.data.length,
  itemBuilder: (context,i){
    var name=snapshot.data[i].name;
return Container(
  margin: EdgeInsets.only(top: 20),
  child:   Column(
  
    children: [
  
          SizedBox(height:20,),
  
          Column(
  
            children: [
  Container(
  
             margin: EdgeInsets.only(top: 10),
  
             child: CircleAvatar(
  
               radius: 90,
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
           
  SizedBox(height: 15,),
            Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.person
                     ,color: Colors.teal,
                     ),
                     title: Text('Name',style: TextStyle(color: Colors.grey),),
                     subtitle:Text(snapshot.data[i].name,style: TextStyle(color: Colors.black)) ,
                     ),
                   ),
                   ),
                    SizedBox(height: 15,),
        /*    Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.calculate
                     ,color: Colors.teal,
                     ),
                     title: Text(snapshot.data[i].age),
                     ),
                   ),
                   ),*/
  
               SizedBox(height: 12,),
            
                 Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.phone
                     ,color: Colors.teal,
                     ),
                     title:Text('Phone number',style: TextStyle(color: Colors.grey)) ,
                     subtitle:Text(snapshot.data[i].phone,style: TextStyle(color: Colors.black)) ,
                     ),
                   ),
                   ),
             
  
            ],
  
          ),
  
        
  
      ////////////////////////
  
       SizedBox(height: 12,),
  
      SizedBox(height: 15,),
              Container(
                    
                   child: Card(
                     child: ListTile(
                     leading: Icon(Icons.description
                     ,color: Colors.teal,
                     ),
                     title:Text('History of the unit',style: TextStyle(color: Colors.grey)),
                     subtitle: Text(snapshot.data[i].qualificatios,style: TextStyle(color: Colors.black)) ,
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
                     subtitle:  Text(snapshot.data[i].email,style: TextStyle(color: Colors.black)),
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
                     title:Text('Location',style: TextStyle(color: Colors.grey)) ,
                     subtitle: Text(snapshot.data[i].address,style: TextStyle(color: Colors.black)),
                     ),
                   ),
                   ),
  
      SizedBox(height: 22,),
  
      /////////////////////////////
  
       ElevatedButton(
                    onPressed:(){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditEmergency(
  id: snapshot.data[i].id,age: snapshot.data[i].age,address: snapshot.data[i].address,name: snapshot.data[i].name,
  path: snapshot.data[i].path,qual: snapshot.data[i].qualificatios, phone:snapshot.data[i].phone ,                  
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
                      SizedBox(height: 22,),
  
      /////////////////////////////
  
       ElevatedButton(
                    onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmergancyHome()));
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
);
  }
  );

       }
             ),
    );
  }

  
}
class Emergancy{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone,path;
  Emergancy(this.id,this.name,this.email,this.role_id,this.address,this.age,this.qualificatios,this.phone,this.path);
}