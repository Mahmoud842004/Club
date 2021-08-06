import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club/models/users.dart';

class FireStore {
  // users collection
  final CollectionReference<Map<String, dynamic>> _users =
      FirebaseFirestore.instance.collection('users');

  final String? userid;

  FireStore({this.userid});

  Future adduser(
      {required String username,
      required String userid,
      String? imageurl}) async {
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

  Stream<List<String>> get folowersstream {
    return _users.doc(userid).collection('followers').snapshots().map(
          (snapshot) => convertquerytolist(snapshot),
        );
  }

  List<String> convertquerytolist(QuerySnapshot snapshot) {
    List<String> usersidslist = [];
    for (var snapshotuser in snapshot.docs) {
      usersidslist.add(snapshotuser.id);
    }
    return usersidslist;
  }

  Stream<Users> get userstream {
    return _users.doc(userid).snapshots().map((event) {
      return Users.fromMap(map: event.data(), id: event.id);
    });
  }
}
