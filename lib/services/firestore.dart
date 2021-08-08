import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';

class FireStore {
  // users collection
  final CollectionReference<Map<String, dynamic>> _users =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference<Map<String, dynamic>> _stories =
      FirebaseFirestore.instance.collection('stories');

  final String? id;

  FireStore({this.id});

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

  Stream get storywatchestream {
    return _stories
        .doc(id)
        .collection('watches')
        .snapshots()
        .map((snapshot) => convertquerytolist(snapshot));
  }

  Stream<List<String>> get followingstream {
    return _users.doc(id).collection('following').snapshots().map(
          (snapshot) => convertquerytolist(snapshot),
        );
  }

  Stream<Story> get storystream {
    return _stories.doc(id).snapshots().map(
          (event) => Story.fromMap(event.data(), event.id),
        );
  }

  List<String> convertquerytolist(QuerySnapshot snapshot) {
    List<String> list = [];
    for (var snapshotuser in snapshot.docs) {
      list.add(snapshotuser.id);
    }
    return list;
  }

  Stream<Users> get userstream {
    return _users.doc(id).snapshots().map((event) {
      return Users.fromMap(map: event.data(), id: event.id);
    });
  }
}
