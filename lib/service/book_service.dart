import 'dart:convert';

import 'package:book_notes/models/book_model.dart';
import 'package:book_notes/utils/api.dart';

class BookService {
  static Future<List<Book>> getBooksByUser({required int userId}) async {
    final response = await CallApi().getData('book/user/$userId');

    if (response.statusCode == 200) {
      final List<dynamic> booksJson = jsonDecode(response.body);
      final List<Book> books =
          booksJson.map((json) => Book.fromJson(json)).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  static Future<dynamic> bookRegister({
    required int userId,
    required String title,
    required String author,
    required String gender,
  }) async {
    Map<String, dynamic> data = {
      'title': title,
      'author': author,
      'gender': gender,
      'sinopse' : 'sinopse',
      'codeUser' : userId,
    };

    final response = await CallApi().postData(data, 'book/register');

    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }
}
