import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';

class CandidateModel extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String photo;
  final DateTime birthday;
  final DateTime expired;

  const CandidateModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.photo,
    required this.birthday,
    required this.expired,
  });

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        photo: json["photo"],
        birthday: DateTime.fromMillisecondsSinceEpoch(json["birthday"]),
        expired: DateTime.fromMillisecondsSinceEpoch(json["expired"] * 1000),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "photo": photo,
        "birthday": birthday,
        "expired": expired,
      };

  @override
  String toString() {
    return '''CandidateModel { id: $id, name: $name, gender: $gender, photo: $photo, birthday: $birthday, expired: $expired }''';
  }

  Candidate toEntity() {
    return Candidate(
        id: id,
        name: name,
        gender: gender,
        photo: photo,
        birthday: birthday,
        expired: expired);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        photo,
        birthday,
        expired,
      ];
}
