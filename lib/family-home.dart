import 'package:flutter/material.dart';
class FamilyHome extends StatefulWidget {
  const FamilyHome({ Key? key }) : super(key: key);

  @override
  _FamilyHomeState createState() => _FamilyHomeState();
}

class _FamilyHomeState extends State<FamilyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
      title: Text('Check patient pulse'),
      centerTitle: true,
      ),
      body:Container() ,
    );
     
  }
}