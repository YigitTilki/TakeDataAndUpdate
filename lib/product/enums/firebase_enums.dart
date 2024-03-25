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
  userId,
  type,
  deviceName,
  createdAt,
  devices;

  String get field => name;
}

CollectionReference get usersCollection => FirebaseCollections.users.reference;
CollectionReference get adminCollection => FirebaseCollections.admin.reference;
CollectionReference get passwordsCollection =>
    FirebaseCollections.passwords.reference;
CollectionReference get devicesCollection =>
    FirebaseCollections.devices.reference;

String get emailField => FirebaseFields.email.field;
String get passwordField => FirebaseFields.password.field;
String get firstNameField => FirebaseFields.firstName.field;
String get lastNameField => FirebaseFields.lastName.field;
String get idField => FirebaseFields.id.field;
String get devicesField => FirebaseFields.devices.field;
String get userIdField => FirebaseFields.userId.field;
String get typeField => FirebaseFields.type.field;
String get deviceNameField => FirebaseFields.deviceName.field;
String get createdAtField => FirebaseFields.createdAt.field;
