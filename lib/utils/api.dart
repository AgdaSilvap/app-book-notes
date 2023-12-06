import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final _url = "http://app-book-api.cloudns.org:8080/";

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  //post
  Future<http.Response> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);

    var response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
    return response;
  }

  //get
  Future<http.Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    print(fullUrl);

    var response = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );

    print(response.statusCode);
    print(response.body);

    return response;
  }
}


