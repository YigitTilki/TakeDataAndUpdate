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
