import 'package:book_notes/pages/login.dart';
import 'package:book_notes/utils/api.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
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
                      controller: passwordTextController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        label: Text('password'),
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
                          _register();
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
