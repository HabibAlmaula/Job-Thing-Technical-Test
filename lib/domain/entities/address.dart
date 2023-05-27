import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String address;
  final String city;
  final String state;
  final int zipCode;

  const Address({
    required this.id,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  @override
  List<Object?> get props => [
        id,
        address,
        city,
        state,
        zipCode,
      ];
}
