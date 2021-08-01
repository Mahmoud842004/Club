import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  // users collection
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future adduser({required String username, required String userid,String? imageurl}) async {
    await _users.doc(userid).set({
      'name': username,
      'profile image': imageurl,
      'background image': null,
      'online': true,
      'saved posts': [],
      'posts': [],
      'stories': [],
    });
  }
}
