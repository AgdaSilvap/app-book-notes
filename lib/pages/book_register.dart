import 'package:book_notes/pages/book_list.dart';
import 'package:book_notes/service/book_service.dart';
import 'package:flutter/material.dart';

class BookRegister extends StatefulWidget {
  const BookRegister({super.key, required this.id});

  final int id;

  @override
  State<BookRegister> createState() => _BookRegister();
}

class _BookRegister extends State<BookRegister> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController authorTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();


  _bookRegister() async {
    print(widget.id);
    var res =  await BookService.bookRegister(userId: widget.id,
        title: titleTextController.text,
        author: authorTextController.text,
        gender: genderTextController.text);
    if (res == 200) {
      Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => BookList(id: widget.id)));
    }
    else {
      print(res);
    }
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Container(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Book Register',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: titleTextController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: 'title',
                            hintText: 'title',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: Color(0xFFF3E5F5),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: authorTextController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            label: Text('author'),
                            hintText: 'author',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: Color(0xFFF3E5F5),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: genderTextController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            label: Text('gender'),
                            hintText: 'gender',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: Color(0xFFF3E5F5),
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: GestureDetector(
                              onTap: () {
                                  _bookRegister();
                              },
                              child: Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}