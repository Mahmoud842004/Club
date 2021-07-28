import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String id;
  final String userid;
  final String content;
  final Timestamp time;

  Notification({
    required this.id,
    required this.userid,
    required this.content,
    required this.time,
  });
}
