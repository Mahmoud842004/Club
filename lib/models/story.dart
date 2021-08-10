import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  final String id;
  final String? imageurl;
  final String? videourl;
  final Timestamp time;
  final String content;
  final bool watched;
  List? watches;

  factory Story.fromMap(
      {Map<String, dynamic>? map, required String id, List? watches}) {
    return Story(
      id: id,
      imageurl: map!['imageurl'],
      videourl: map['videourl'],
      time: map['time'],
      content: map['content'],
      watched: map['watched'],
      watches: watches,
    );
  }

  Story({
    required this.id,
    required this.imageurl,
    required this.videourl,
    required this.time,
    required this.content,
    required this.watched,
    this.watches,
  });
}
