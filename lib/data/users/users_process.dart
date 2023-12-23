import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<Map<String, dynamic>>> getUsers() async {
  QuerySnapshot querySnapshot = await _firestore.collection('users').get();
  List<Map<String, dynamic>> userList = [];

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    userList.add(doc.data() as Map<String, dynamic>);
  }

  return userList;
}
