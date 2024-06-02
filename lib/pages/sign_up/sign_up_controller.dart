import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace_flutter/common/widgets/popup_messages.dart';

import '../../common/global_loader/global_loader.dart';
import 'notifier/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Please enter your name");
      return;
    }

    if (state.userName.length < 4 || name.length < 4) {
      toastInfo("UserName must be at least 4 characters");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Please enter your email");
      return;
    }

    if (!state.email.contains("@") || !state.email.contains(".")) {
      toastInfo("Please enter a valid email");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Please enter your password");
      return;
    }

    // password must be at least 8 characters including a number and a special character and a capital letter
    if (!state.password.contains(RegExp(r'[0-9]')) ||
        !state.password.contains(RegExp(r'[A-Z]')) ||
        !state.password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      toastInfo(
          "Password must contain a number, a special character and a capital letter");
      return;
    }

    if (state.password != state.confirmPassword || confirmPassword.isEmpty) {
      toastInfo("Password does not match");
      return;
    }

    //show the loader icon
    ref.read(appLoaderProvider.notifier).setLoader(true);

      //we are using the navigator to navigate to the previous page
      var context = Navigator.of(ref.context);
      try {
        //call the api of sign up firebase google email
        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        //the kDebugMode is a constant that is set to true in debug mode and false in release mode
        //we are using it to print the credentials in debug mode just to see the data
        if (kDebugMode) {
          print(credentials);
        }
        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(name);
          //get server photo url
          //set the user photo url
          toastInfo("Account created successfully, please verify your email");
          context.pop();
        }
      }on FirebaseAuthException catch(e){
        if(e.code=='weak-password'){
          toastInfo("This password is too weak");
        }else if(e.code=='email-already-in-use'){
          toastInfo("This email address has already been registered");
        }else if(e.code=='user-not-found'){
          toastInfo("User not found");
        }

      }catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
      }

      //show the register page
      ref.watch(appLoaderProvider.notifier).setLoader(false);
    }

}
