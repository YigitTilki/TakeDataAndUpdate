import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  users,
  devices,
  passwords,
  admin,
  version;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}

enum FirebaseFields {
  id,
  firstName,
  lastName,
  email,
  password,
  devices;

  String get field => name;
}

CollectionReference get usersCollection => FirebaseCollections.users.reference;
CollectionReference get adminCollection => FirebaseCollections.admin.reference;
CollectionReference get passwordsCollection =>
    FirebaseCollections.passwords.reference;

String get emailField => FirebaseFields.email.field;
String get passwordField => FirebaseFields.password.field;
String get firstNameField => FirebaseFields.firstName.field;
String get lastNameField => FirebaseFields.lastName.field;
String get idField => FirebaseFields.id.field;
String get devicesField => FirebaseFields.devices.field;
