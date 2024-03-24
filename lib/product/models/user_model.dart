import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.devices,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      devices: (json['devices'] as List<dynamic>?)
          ?.map((device) => device.toString())
          .toList(),
    );
  }

  final String? id;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final List<String>? devices;

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    List<String>? devices,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      devices: devices ?? this.devices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'devices': devices,
    };
  }

  @override
  List<Object?> get props =>
      [id, email, password, firstName, lastName, devices];
}
