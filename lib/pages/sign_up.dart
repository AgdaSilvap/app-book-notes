import 'package:book_notes/pages/login.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController textController = TextEditingController();

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
                    controller: textController,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Name',
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
                    controller: textController,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text('User Name'),
                      hintText: 'User Name',
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
                    controller: textController,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: 'Password',
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
                      child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //pegar nameUser, comparar com o banco,
                        // se não existir, fazer um post/create e ir para logn.
                        //Else : exibir mensagem de usuário já existente.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cadastro realizado com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
