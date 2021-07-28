import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String shareduserid;
  final String userid;
  final String imageurl;
  final String videourl;
  final String content;
  final Timestamp time;
  final List userlikes;
  final int commentsnumber;
  final int sharednumber;

  Post({
    required this.id,
    required this.shareduserid,
    required this.userid,
    required this.imageurl,
    required this.videourl,
    required this.content,
    required this.time,
    required this.userlikes,
    required this.commentsnumber,
    required this.sharednumber,
  });
}
