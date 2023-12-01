import 'package:flutter/material.dart';
import 'package:book_notes/pages/book_list.dart';
import 'package:book_notes/pages/sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: NetworkImage(
              'https://images.unsplash.com/photo-1546521343-4eb2c01aa44b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8fA%3D%3D'),
        ),
        Container(
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
        ),
        Align(
          alignment: Alignment.center,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'User name',
                      hintText: 'Digite seu usuário!',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Color(0xFFF3E5F5),
                      filled: true,
                    ),
                    validator: (email) {
                      if (email == null) {
                        return 'Digite seu usuário!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: 'Digite aqui sua senha',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Color(0xFFF3E5F5),
                      filled: true,
                    ),
                    validator: (senha) {
                      if (senha == null) {
                        return 'Digite seu Senha!';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SingUp()));
                        },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BookList()));
                        },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
