
import 'package:flutter/material.dart';

class CardBook extends StatelessWidget {
  final String title;
  final String author;
  final String gender;
  final String sinopse;
  final int codeUser;

  const CardBook({
    Key? key,
    required this.title,
    required this.author,
    required this.gender,
    required this.sinopse,
    required this.codeUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.purple),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            'https://img.elo7.com.br/product/600x380/1CAA974/papel-de-parede-adesivo-livros-bobina-de-50x300cm-papel-de-parede.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              author,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              gender,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
