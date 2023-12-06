import 'dart:convert';

import 'package:book_notes/models/book_model.dart';
import 'package:book_notes/utils/api.dart';

class BookService {
  static Future<List<Book>> getBooksByUser({required int userId}) async {
    final response = await CallApi().getData('book/user/$userId');

    if (response.statusCode == 200) {
      final List<dynamic> booksJson = jsonDecode(response.body);
      final List<Book> books = booksJson.map((json) => Book.fromJson(json)).toList();
      print(books);
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}

