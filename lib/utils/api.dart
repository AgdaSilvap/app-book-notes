import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi{
  final _url = "http://app-book-api.cloudns.org:8080/";

 Future<dynamic> postData(data, apiUrl) async{

   var fullUrl = _url+apiUrl;

   //post
   var response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );

   return response.statusCode;
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

}