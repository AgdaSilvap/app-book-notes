import 'dart:convert';

import 'package:book_notes/utils/api.dart';

class UserService {
  static Future<int> login({required String username, required String password}) async {
    var data = {
      'username': username,
      'password': password,
    };

    final response = await CallApi().postData(data,'auth/login');

    if (response.statusCode == 200) {
      final Map<String, dynamic> user = jsonDecode(response.body);
      return user['code'];
    } else {
      throw Exception('Failed to load user');
    }
  }
}