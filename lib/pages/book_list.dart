import 'package:book_notes/components/book.dart';
import 'package:book_notes/components/list_books.dart';
import 'package:book_notes/models/book_model.dart';
import 'package:book_notes/pages/book_register.dart';
import 'package:book_notes/service/book_service.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key, required this.id});

  final int id;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  Future<List<Book>>? futureBooks;

  @override
  void initState() {
    futureBooks = BookService.getBooksByUser(userId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Book Notes',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Book List'),
            leading: const Icon(Icons.menu_book_sharp),
          ),
          body: FutureBuilder(
            future: futureBooks,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final books = snapshot.data as List<Book>;
                return ListBooks(book : books);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => BookRegister(id: widget.id),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}
