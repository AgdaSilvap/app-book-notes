import 'package:book_notes/models/book_model.dart';
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
    print(widget.id);
    //futureFilmes = getFilmes();
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
          body: Stack(children: [
            ListView(
              children: [
               Column(
                 children: [
                   FutureBuilder<List<Book>>(
                     future: futureBooks,
                     builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text( snapshot.data!.map((book) {
                            return Column(
                              children: [
                                Text(book.title),
                                Text(book.author),
                                Text(book.gender),
                              ],
                            );
                          }).toString()
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                       return const CircularProgressIndicator();
                     },
                   ),
                 ],
               )
              ],
            )
          ]),
        ));
  }
}
