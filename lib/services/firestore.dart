import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club/models/story.dart';
import 'package:club/models/users.dart';
import 'package:club/services/responsive_addaptive.dart';
import 'package:club/services/storage.dart';
import 'package:club/widgets/app_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class FireStore {
  // users collection
  final CollectionReference<Map<String, dynamic>> _users =
      FirebaseFirestore.instance.collection('users');
  // stories collection
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
          (event) => Story.fromMap(map: event.data(), id: event.id),
        );
  }

  List<String> convertquerytolist(QuerySnapshot snapshot) {
    List<String> list = [];
    for (var snapshotuser in snapshot.docs) {
      list.add(snapshotuser.id.trim());
    }
    return list;
  }

  Stream<Users> get userstream {
    return _users.doc(id).snapshots().map((event) {
      return Users.fromMap(map: event.data(), id: event.id);
    });
  }

  Future getstorieslist(List storiesids) async {
    try {
      List<Story> storieslist = [];
      for (var storyid in storiesids) {
        var watches = await _stories.doc(storyid).collection('watches').get();
        var watcheslist = convertquerytolist(watches);
        var story = await _stories.doc(storyid).get();
        storieslist.add(
          Story.fromMap(id: story.id, map: story.data(), watches: watcheslist),
        );
      }
      return storieslist;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future markstoryaswatched(String storyid, String currentuserid,
      BuildContext context, bool currentuser) async {
    try {
      if (currentuser) {
        await _stories.doc(storyid).update({
          'watched': true,
        });
      } else {
        await _stories
            .doc(storyid)
            .collection('watches')
            .doc(currentuserid)
            .set({});
      }
    } catch (e) {
      String error = await ResponsiveAddaptive.translate(context, e.toString());
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(error));
    }
  }

  Future addstory({
    required Users user,
    required File file,
    required String filetype,
    required String content,
    required Function(bool) setstate,
    required BuildContext context,
    required int? videotime,
  }) async {
    var connection = await Connectivity().checkConnectivity();
    if (connection != ConnectivityResult.none) {
      setstate(true);
      String storyid = randomString(20);
      Storage().addandgetstoryfile(file, storyid).then((url) {
        _stories.doc(storyid).set({
          'content': content,
          'imageurl': filetype == 'photo' ? url : null,
          'videourl': filetype == 'video' ? url : null,
          'watched': false,
          'time': Timestamp.now(),
          'video time': videotime,
        }).then((value) {
          List newstorieslist = user.stories;
          newstorieslist.add(storyid);
          _users.doc(user.id).update({
            'stories': newstorieslist,
          });
        });
      }).onError((error, stackTrace) async {
        var translate = await ResponsiveAddaptive.translate(
          context,
          error.toString(),
        );
        ScaffoldMessenger.of(context).showSnackBar(showsnackbar(translate));
      });
      Future.delayed(Duration(seconds: 1)).then(
        (value) async {
          setstate(false);
          var translate = await ResponsiveAddaptive.translate(
              context, 'The Story is posting now');
          ScaffoldMessenger.of(context).showSnackBar(showsnackbar(translate));
          Navigator.pop(context);
        },
      );
    } else {
      var translate = await ResponsiveAddaptive.translate(
          context, 'There is no internet connection');
      ScaffoldMessenger.of(context).showSnackBar(showsnackbar(translate));
    }
  }

  Stream<List<String>> get storywatchingstream {
    return _stories
        .doc(id)
        .collection('watches')
        .snapshots()
        .map((snapshot) => convertquerytolist(snapshot));
  }
}
