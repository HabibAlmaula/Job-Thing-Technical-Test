import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';

class BlogModel extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final String photo;
  final String content;
  final String author;
  final DateTime createAt;
  final List<String> tag;

  const BlogModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.content,
    required this.author,
    required this.createAt,
    required this.tag,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        photo: json["photo"],
        content: json["content"],
        author: json["author"],
        createAt: DateTime.fromMillisecondsSinceEpoch(json["create_at"]*1000),
        tag: json["tag"].toString().split(','),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "photo": photo,
        "content": content,
        "author": author,
        "create_at": createAt,
        "tag": tag,
      };

  @override
  String toString () {
    return '''BlogModal { id: $id, title: $title, subTitle: $subTitle, photo: $photo, content: $content, author: $author, createdAt: $createAt, tag: $tag }''';
  }

  Blog toEntity() {
    return Blog(
        id: id,
        title: title,
        subTitle: subTitle,
        photo: photo,
        content: content,
        author: author,
        createAt: createAt,
        tag: tag);
  }

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
