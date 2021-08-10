import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String id;
  final String lastmessageid;
  final Timestamp time;

  ChatRoom({
    required this.id,
    required this.lastmessageid,
    required this.time
  });
}
