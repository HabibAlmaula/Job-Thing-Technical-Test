import 'package:equatable/equatable.dart';

class Candidate extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String photo;
  final DateTime birthday;
  final DateTime expired;

  const Candidate({
    required this.id,
    required this.name,
    required this.gender,
    required this.photo,
    required this.birthday,
    required this.expired,
  });

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
