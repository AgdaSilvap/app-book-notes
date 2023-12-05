import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key, required this.id});

  final int id;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {

  @override
  void initState() {
    print(widget.id);
    //futureFilmes = getFilmes();
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
                   Padding(
                     padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 8.0, bottom: 4.0),
                     child: Container(
                       height: 180,
                       width: 350,
                       color: Colors.purple.shade50,
                       child: const Column(
                         children: [
                           Text('A Seleção')
                         ],
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 4.0, bottom: 4.0),
                     child: Container(
                       height: 180,
                       width: 350,
                       color: Colors.purple.shade50,
                     ),
                   ),
                 ],
               )
              ],
            )
          ]),
        ));
  }
}
