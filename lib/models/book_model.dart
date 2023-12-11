
class Book {
  final String title;
  final String author;
  final String gender;
  final String sinopse;
  final int codUser;

  Book({
    required this.title,
    required this.author,
    required this.gender,
    required this.sinopse,
    required this.codUser,

  });

  Book.fromJson(Map<String, dynamic> json) :
   // print(json);
      title = json['title'].toString(),
      author = json['author'].toString(),
      gender = json['gender'].toString(),
      sinopse = json['sinopse'].toString(),
      codUser = json['codeUser'] ?? 0;
}
