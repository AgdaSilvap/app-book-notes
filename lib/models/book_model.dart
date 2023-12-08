
class Book {
  final int code;
  final String title;
  final String author;
  final String gender;
  final String createdAt;
  final String sinopse;
  final int codUser;

  Book({
    required this.code,
    required this.title,
    required this.author,
    required this.gender,
    required this.createdAt,
    required this.sinopse,
    required this.codUser,

  });

  Book.fromJson(Map<String, dynamic> json) :
   // print(json);
      code = json['code'] ?? 0,
      title = json['title'].toString(),
      author = json['author'].toString(),
      gender = json['gender'].toString(),
      createdAt = json['createdAt'].toString(),
      sinopse = json['sinopse'].toString(),
      codUser = json['codeUser'] ?? 0;
}
