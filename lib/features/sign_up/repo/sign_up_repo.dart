import 'package:firebase_auth/firebase_auth.dart';

class SignUpRep{

  static Future<UserCredential> firebaseSignUp(String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }
}