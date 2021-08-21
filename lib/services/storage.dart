import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final Reference ref = FirebaseStorage.instance.ref();

 Future addandgetstoryfile(File file, String id) async {
    UploadTask task =  ref.child(id).putFile(file);
   await task.whenComplete(() =>null);
    String url = await ref.child(id).getDownloadURL();
    return url;
  }
}
