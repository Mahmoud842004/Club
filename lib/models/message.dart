import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String userid;
  final String imageurl;
  final String videourl;
  final String audiourl;
  final String content;
  final bool seened;
  final Timestamp time;

  Message({
    required this.id,
    required this.userid,
    required this.imageurl,
    required this.videourl,
    required this.audiourl,
    required this.content,
    required this.time,
    required this.seened,
  });
}
