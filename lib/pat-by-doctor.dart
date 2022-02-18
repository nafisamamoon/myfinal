import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class PatByDoctor extends StatelessWidget {
  const PatByDoctor({ Key? key }) : super(key: key);
Future<List<Patient>>getDoctors() async {
  int p=3;
    final String _url='http://192.168.2.189:8000/api/pat-by-doctor/$p';
var response=await http.get(Uri.parse(_url));
var jsonDatae=jsonDecode(response.body);
print('///////////////////');
print(jsonDatae[0][0]['id']);
print('///////////////////');
//print(jsonDatae);
List<Patient> doctors=[];
try{

for(int o=0;o<1;o++){
for(var u in jsonDatae){
  Patient user=new Patient(u[0][o]['id'],u[0][o]['name'],u[0][o]['diagnosis'],u[0][o]['patient_phone_number'],u[0][o]['age'],u[0][o]['address'],u[0][o]['patient_companion_phone_number'],u[0][o]['path']);
  doctors.add(user);
  print(doctors);
}
}


}catch(e){
print(e);
}

print(doctors.length);
return doctors;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
 FutureBuilder(
              future:getDoctors() ,
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.data ==null)
{
  return Container(child: Center(child: CircularProgressIndicator(),
  ),
  );
} else return Expanded(
  child:   ListView.builder(
  
  
  
    shrinkWrap: true,
  
  
  
    itemCount: snapshot.data.length,
  
  
  
    itemBuilder: (context,i){
  
  
  
  return SingleChildScrollView(
  
    child:   Column(
  
    

    children: [
  
  
      //title: Text(snapshot.data[i].name),
  
      Card(
  
              child: Row(
  
  
                children: [
  
            Container(
  
              margin: EdgeInsets.only(top: 15,bottom: 15),
  
              child:  CircleAvatar(
  
                      radius: 90,
  
                  backgroundImage: CachedNetworkImageProvider('http://192.168.2.189:8000/uploads/'+snapshot.data[i].path)

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
  
  
                    margin: EdgeInsets.only(left: 50),
  
                    child: TextButton(

                 onPressed: (){
                   
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
  
      ),
  
  );
  
  
    }

  
    ),
);
              }
              )
          ],
        ),
      ),
    );
  }
}
class Patient{
  final int id,age;
  final String name,address,diagnosis,patient_phone_number,path,patient_companion_phone_number;
  Patient(this.id,this.name,this.diagnosis,this.patient_phone_number,this.address,this.age,this.patient_companion_phone_number,this.path);
}