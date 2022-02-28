import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/admin-home.dart';
import 'package:project/doctor-home.dart';
import 'package:project/emergancy-home.dart';
import 'package:project/family-home.dart';
import 'package:project/registrar-home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:project/global.dart';
import 'package:project/one-login-service.dart';
class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool circular=false;
  var i;
  @override
  void initState() {
    read();
    // TODO: implement initState
    super.initState();
  }
   var status;
   String _email = '';
  String _password = '';
  loginPressed() async {
    
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await OneLoginServices.login(_email, _password);
      status=response.body.contains('error');
      Map responseMap = jsonDecode(response.body);
     
      //var id=responseMap["user"]["id"];
      if (response.statusCode == 200) {
         setState(() {
          circular=false;
        });
       // Navigator.push(
           // context,
           // MaterialPageRoute(
            //  builder: (BuildContext context) =>  ViewPatients(id),
           // ));
           //getPatient(id);
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DoctorList()));
           //print('///////////&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      //print(responseMap['id']);
      int myid=responseMap['id'];
           //await storage.write(key:"token",value:responseMap["token"]);
          // print('success');
           //print('mytoken : ${responseMap['token']}');
           save(responseMap['token']);
            i=responseMap['role_id'];
            saveRole(responseMap['role_id']);
            saveId(responseMap['id']);
          // print(i);
           getRoleId(i);
           
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>alldevice()));
      } else {
        setState(() {
          circular=false;
        });
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
       setState(() {
          circular=false;
        });
      errorSnackBar(context, 'enter all required fields');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(image: AssetImage('images/doctor.jpg'),
              fit: BoxFit.fill,
              height: 40,
              )
              ),
           Container(
            
            margin: EdgeInsets.only(top: 290),
            height: 350,
            child: Card(
              color: Colors.white,
              elevation: 19,
            /*  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)
              ),*/
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextFormField(
                      keyboardType:TextInputType.emailAddress ,
                       onChanged: (value) {
                  _email = value;
                },
                      decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle: TextStyle(fontSize: 20,wordSpacing: 2),
                        prefixIcon: Icon(Icons.email)
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: TextFormField(
                      obscureText: true,
                           onChanged: (value) {
                  _password = value;
                },
                      decoration: InputDecoration(
                        
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: 20,wordSpacing: 2),
                          prefixIcon: Icon(Icons.lock
                      ),
                    ),
                  ),),
                  SizedBox(height: 60,),
                  ElevatedButton(
                    onPressed:(){
                      setState(() {
                        circular=true;
                      });
                      loginPressed();
                    },
                    child:circular? CircularProgressIndicator(color: Colors.white): Text('login',
                    style: TextStyle(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.w900),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      fixedSize: Size(370, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                    ),
                    )
                ],
              ),
            ),
          ),]
        ),
      )
    );
  }
  read() async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=pref.get(Key) ?? 0;
  if(ValueKey != '0'){
    final prefs=await SharedPreferences.getInstance();
    final key='role';
    final ValueKey1=prefs.getInt(key);
    switch(ValueKey1){
  case 1:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHome()));
    break;
  }
  case 2:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrarHome()));
    break;
  }
  case 3:{
      re();
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>doctorhome()));
    break;
  }
   case 4:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmergancyHome()));
    break;
  }
  case 5:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FamilyHome()));
    break;
  }
}
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>alldevice()));
  }
  //print('################################');
  //print('read : $ValueKey');
  
}
getRoleId(int id){
switch(id){
  case 1:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminHome()));
    break;
  }
  case 2:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrarHome()));
    break;
  }
  case 3:{
  re();
    print('lol');
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>doctorhome()));
    break;
  }
   case 4:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmergancyHome()));
    break;
  }
 case 5:{
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FamilyHome()));
    break;
  }
}
}
 /*re()async{
      final prefsS=await SharedPreferences.getInstance();
    final key='id';
    final ValueKey2=prefsS.getInt(key);
    print(ValueKey2);
    final String _url='http://192.168.73.189:8000/api/mypat/$ValueKey2';
    try{
       http.Response response=await http.get(Uri.parse(_url));
      if(response.statusCode == 200){
        var i=json.decode(response.body);
        
      print('*************************************');
      print(i);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>doctorhome(i)));
       // return i;
      }else{
        return 'fail';
      }
    }catch(e){
      print(e);
      return 'failed';
    }
    }*/
    re()async{
      final prefsS=await SharedPreferences.getInstance();
    final key='id';
    final ValueKey2=prefsS.getInt(key);
    print(ValueKey2);
    final String _url='http://192.168.2.189:8000/api/mypatient/$ValueKey2';
    try{
       http.Response response=await http.get(Uri.parse(_url));
      if(response.statusCode == 200){
        var i=json.decode(response.body);
        
      print('*************************************');
      print(i);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorHome(i,ValueKey2!)));
        return i;
      }else{
        return 'fail';
      }
    }catch(e){
      print(e);
      return 'failed';
    }
    }
}
save(String token) async {
  final pref=await SharedPreferences.getInstance();
  final Key='token';
  final ValueKey=token;
  pref.setString(Key,ValueKey);
}
saveRole(int role)async{
  final pref=await SharedPreferences.getInstance();
  final Key='role';
  final ValueKey1=role;
  pref.setInt(Key, ValueKey1);
}
saveId(int y)async{
 final pref=await SharedPreferences.getInstance();
  final Key='id';
  final ValueKey2=y;
  pref.setInt(Key, ValueKey2);
}