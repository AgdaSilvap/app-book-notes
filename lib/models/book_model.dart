
// "code": 2,
// "title": "TituloTest2",
// "author": "AutorTest2",
// "gender": "GeneroTest2",
// "createdAt": "2023-11-25 03:43:39.658735+00",
// "imageUrl": "ImagemTest2",
// "sinopse": "SinopseTest2",
// "linkReference": "LinkTest2",
// "codeUser": 2

class Book {
  final int code;
  final String title;
  final String author;
  final String gender;
  final String createdAt;
  final String imageurl;
  final String sinopse;
  final String linkreference;

  Book({
    required this.code,
    required this.title,
    required this.author,
    required this.gender,
    required this.createdAt,
    required this.imageurl,
    required this.sinopse,
    required this.linkreference,
  });

  Book.fromJson(Map<String, dynamic> json) :
   // print(json);
      code = json['code'] ?? 0,
      title = json['title'].toString(),
      author = json['author'].toString(),
      gender = json['gender'].toString(),
      createdAt = json['createdAt'].toString(),
      imageurl = json['imageurl'].toString(),
      sinopse = json['sinopse'].toString(),
      linkreference = json['linkReference'].toString();
}
