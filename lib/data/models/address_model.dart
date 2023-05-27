import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/domain/entities/address.dart';

class AddressModel extends Equatable {
  final int id;
  final String address;
  final String city;
  final String state;
  final int zipCode;

  const AddressModel({
    required this.id,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
      };

  Address toEntity() {
    return Address(
      id: id,
      address: address,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }

  @override
  List<Object?> get props => [
        id,
        address,
        city,
        state,
        zipCode,
      ];
}
