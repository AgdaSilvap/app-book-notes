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
      print(books);
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
    required String creatAt,
    required String imageurl,
    required String sinopse,
    required String linkreference,
  }) async {
    var data = {
      'code': userId,
      'title': title,
      'author': author,
      'gender': gender,
      'createdAt': creatAt,
      'imageurl': imageurl,
      'sinopse': sinopse,
      'linkreference': linkreference
    };

    final response = await CallApi().postData(data, 'book/register');
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> book = jsonDecode(response.body);
      return book['code'];
    } else {
      throw Exception('Failed to load user');
    }
  }
}
