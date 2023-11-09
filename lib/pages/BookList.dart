import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

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
            leading: Icon(Icons.menu_book_sharp),
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
                       child: Column(
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
