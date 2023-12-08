import 'package:flutter/material.dart';
import 'package:book_notes/models/book_model.dart';
import 'package:book_notes/components/book.dart';

class ListBooks extends StatelessWidget {
  const ListBooks({
    Key? key,
    required this.book,
  }) : super(key: key);

  final List<Book> book;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: book.length,
      itemBuilder: ((context, index) {
        final books = book[index];
        return CardBook(
          code: books.code,
          title: books.title,
          author: books.author,
          gender: books.gender,
        );
      }),
    );
  }
}