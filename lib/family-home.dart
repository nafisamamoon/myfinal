import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FamilyHome extends StatefulWidget {
  const FamilyHome({ Key? key }) : super(key: key);

  @override
  _FamilyHomeState createState() => _FamilyHomeState();
}

class _FamilyHomeState extends State<FamilyHome> {
  Timer? timer;
  List mylist=[];
 //List<Doctor> users=[];
   Future apicall()async{
http.Response response;
timer=Timer.periodic(Duration(seconds: 8), (timer)async {
//response=await http.get(Uri.parse('http://192.168.2.189:8000/api/all'));
response=await http.get(Uri.parse('https://iotwebsite1.000webhostapp.com/get_data.php?number=5'));
if(response.statusCode == 200){
setState(() {
 
  mylist=json.decode(response.body);
print(mylist);
});
}
});
  }
  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
      title: Text('Check patient pulse'),
      centerTitle: true,
        actions: [
         
       IconButton(onPressed: (){
       timer!.cancel();
       Navigator.pop(context);
        
       }, icon: Icon(Icons.backpack))
      ],
      ),
      body:ListView.builder(
  itemCount: mylist == null ? 0 : mylist.length,
  itemBuilder: (context,i){

   return ListTile(
     // title: Text(mylist[i]['id'].toString()),
     leading:Icon(Icons.favorite,color: Colors.red,),
      //title: Text(mylist[i]['name'].toString()),
      //subtitle: Text(mylist[i]['updated_at'].toString()),
      title: Text(mylist[i]['bpm'].toString()),
      subtitle: Text(mylist[i]['time'].toString()),
     /* trailing: IconButton(onPressed: (){
        setState(() {
          //print(':;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
          //print(mylist[i]['id']);
         // var id=mylist[i]['id'];
    //deleteUser(id);
        });
      }, 
      icon: Icon(Icons.delete)
      ),*/
    );
  }
  
  ) ,
    );
     
  }
}