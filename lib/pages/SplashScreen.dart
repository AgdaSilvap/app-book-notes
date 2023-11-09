import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image(
            fit: BoxFit.scaleDown,
            height: double.infinity,
            width: double.infinity,
          image: NetworkImage(
              'https://img.freepik.com/vetores-premium/logotipo-do-livro-de-educacao_609277-1033.jpg')),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.purpleAccent.withOpacity(0.15),
              Colors.purpleAccent.withOpacity(0.15),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
      ]),
    );
  }
}
