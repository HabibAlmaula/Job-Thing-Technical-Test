import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final String photo;
  final String content;
  final String author;
  final DateTime createAt;
  final List<String> tag;

  const Blog({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.content,
    required this.author,
    required this.createAt,
    required this.tag,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subTitle,
        photo,
        content,
        author,
        createAt,
        tag,
      ];
}
