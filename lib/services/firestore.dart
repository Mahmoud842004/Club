import 'package:cloud_firestore/cloud_firestore.dart';
class FireStore {
  // users collection
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future adduser({required String username, required String userid}) async {
    await _users.doc(userid).set({
      'name': username,
      'profile image': null,
      'background image': null,
      'online': true,
      'posts': [],
      'stories': [],
    });
  }
}
