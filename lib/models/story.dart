import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  final String id;
  final String userid;
  final String imageurl;
  final String videourl;
  final String audiourl;
  final List watches;
  final Timestamp deadlinetime;
  final String content;

  Story({
    required this.id,
    required this.imageurl,
    required this.videourl,
    required this.audiourl,
    required this.watches,
    required this.deadlinetime,
    required this.content,
    required this.userid,
  });
}
