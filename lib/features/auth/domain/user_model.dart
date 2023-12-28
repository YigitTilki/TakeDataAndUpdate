class UserModel {
  late String? id;
  late String? email;
  late String? password;
  late String? firstName;
  late String? lastName;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  });

  // CopyWith method to create a new instance with updated values
  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
