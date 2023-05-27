import 'package:equatable/equatable.dart';

class Email extends Equatable {
  final int id;
  final String email;
  final String phone;

  const Email({
    required this.id,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
      ];
}
