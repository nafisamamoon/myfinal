import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/global.dart';
//import 'package:myauth/token-test/global-token.dart';
//import 'package:myauth/globals.dart';
class OneLoginServices {
static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    
    var url = Uri.parse('http://192.168.73.189:8000/api/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    //print(response.body);
    return response;
  }
}