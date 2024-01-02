class UserModel {
  UserModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.devices,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
    firstName = json['firstName'].toString();
    lastName = json['lastName'].toString();
    devices = json['devices'].toString();
  }
  late String? id;
  late String? email;
  late String? password;
  late String? firstName;
  late String? lastName;
  late String? devices;

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? devices,
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
}
