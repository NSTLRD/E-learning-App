import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo{

  static Future<UserCredential> firebaseSignIn(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }


}