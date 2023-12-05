import 'dart:convert';

import 'package:book_notes/pages/login.dart';
import 'package:book_notes/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  _register() async {
    var data = {
      'name': nameTextController.text,
      'username': userNameTextController.text,
      'password': passwordTextController.text,
    };

    var res = await CallApi().postData(data, 'auth/register');
    if (res == 200) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.purpleAccent.withOpacity(0.5),
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.5),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome';
                        }
                      },
                      controller: nameTextController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        labelText: 'name',
                        hintText: 'name',
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
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome de usuário';
                        }
                      },
                      controller: userNameTextController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text('username'),
                        hintText: 'username',
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
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome de usuário';
                        }
                      },
                      controller: passwordTextController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text('password'),
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: 'password',
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
                        if (_formKey.currentState!.validate()) {
                          _register();
                        }
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
                            'SignUp',
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
        ),
      ),
    );
  }
}
