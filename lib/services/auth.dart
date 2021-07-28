import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  var auth = FirebaseAuth.instance;
  getcurrentuser() {
    return auth.currentUser;
  }
}
