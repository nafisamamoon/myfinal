import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ShowData extends StatefulWidget {
  const ShowData({ Key? key }) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  
  show()async{
    var response=await http.get(Uri.parse('http://Iotwebsite1.000webhostapp.com/insert.php'));
    var jsondata=jsonDecode(response.body);
    print('///////////////////////////');
    print(jsondata);
  }
  @override
  void initState() {
    show();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}