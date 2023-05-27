import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/domain/entities/email.dart';

class EmailModel extends Equatable {
  final int id;
  final String email;
  final String phone;

  const EmailModel({
    required this.id,
    required this.email,
    required this.phone,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
      };

  Email toEntity() {
    return Email(id: id, email: email, phone: phone);
  }

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
      ];
}
