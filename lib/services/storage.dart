import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage _storage = FirebaseStorage.instance;

 Future addandgetstoryfile(File file, String id) async {
    UploadTask task =  _storage.ref().child(id).putFile(file);
   await task.whenComplete(() => print('done'));
    String url = await _storage.ref().child(id).getDownloadURL();
    return url;
  }
}
