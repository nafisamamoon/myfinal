import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class RegistrarProfile extends StatefulWidget {
  const RegistrarProfile({ Key? key }) : super(key: key);

  @override
  _RegistrarProfileState createState() => _RegistrarProfileState();
}

class _RegistrarProfileState extends State<RegistrarProfile> {
  Future<List<Registrar>>getRegistrar() async {
    final String _url='http://192.168.73.189:8000/api/getregistrar';
var response=await http.get(Uri.parse(_url));
var jsonData=jsonDecode(response.body);
List<Registrar> users=[];
for(var u in jsonData){
  Registrar user=new Registrar(u['id'],u['name'],u['email'],u['role_id'],u['address'],u['age'],u['qualifications'],u['phone_number'],u['path']);
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
                future: getRegistrar(),
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
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
           
  
               SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.person
                 ,color: Colors.teal,
                 ),
                 title: Text(snapshot.data[i].name),
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
                 title: Text(snapshot.data[i].phone),
                 ),
               ),
               ),
            ],
  
          ),
  
        
  
      ////////////////////////
  
          SizedBox(height: 12,),
  
      Container(
                
               child: Card(
                 child: ListTile(
                 leading: Icon(Icons.description
                 ,color: Colors.teal,
                 ),
                 title: Text(snapshot.data[i].qualificatios),
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
                 title: Text(snapshot.data[i].email),
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
                 title: Text(snapshot.data[i].address),
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
);
  }
  );

       }
             ),
    );
  }
}
class Registrar{
  final int id,role_id,age;
  final String name,email,address,qualificatios,phone,path;
  Registrar(this.id,this.name,this.email,this.role_id,this.address,this.age,this.qualificatios,this.phone,this.path);
}
/*
Scaffold(
body:  FutureBuilder(
                future: getRegistrar(),
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
  
               backgroundImage: CachedNetworkImageProvider('http://192.168.73.189:8000/uploads/'+snapshot.data[i].path)),
  
             ),
           
  
                Container(
  
        margin: EdgeInsets.only(right: 340),
  
        child: Text('Name',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
  
      ),
  
               SizedBox(height: 12,),
  
       Container(
  
           margin: EdgeInsets.only(right: 280),
  
        child: Text(snapshot.data[i].name,style: TextStyle(fontWeight: FontWeight.w300),),
  
      ),
  
  
              
  
            
  
            
  
             
  
               
  
                SizedBox(height: 18,),
  
               
                Container(
  
        margin: EdgeInsets.only(right: 340),
  
        child: Text('Phone',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
  
      ),
  
               SizedBox(height: 12,),
  
       Container(
  
           margin: EdgeInsets.only(right: 280),
  
        child: Text(snapshot.data[i].phone,style: TextStyle(fontWeight: FontWeight.w300),),
  
      ),
             
  
            ],
  
          ),
  
        
  
      ////////////////////////
  
       SizedBox(height: 12,),
  
      Container(
  
        margin: EdgeInsets.only(right: 340),
  
        child: Text('About',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
  
      ),
  
      SizedBox(height: 12,),
  
      Container(
  
        child: Text(snapshot.data[i].qualificatios,
  
        style: TextStyle(fontWeight: FontWeight.w300),),
  
      ),
  
      SizedBox(height: 12,),
  
      Container(
  
        margin: EdgeInsets.only(right: 340),
  
        child: Text('Email',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
  
      ),
  
      SizedBox(height: 12,),
  
      Container(
  
           margin: EdgeInsets.only(right: 280),
  
        child: Text(snapshot.data[i].email,style: TextStyle(fontWeight: FontWeight.w300),),
  
      ),
  
      SizedBox(height: 12,),
  
      SizedBox(height: 12,),
  
      Container(
  
        margin: EdgeInsets.only(right: 300),
  
        child: Text('Address',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19),),
  
      ),
  
      SizedBox(height: 12,),
  
      Container(
  
           margin: EdgeInsets.only(right: 240),
  
        child: Text(snapshot.data[i].address,style: TextStyle(fontWeight: FontWeight.w300),),
  
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
);
  }
  );

       }
             ),
    );
*/