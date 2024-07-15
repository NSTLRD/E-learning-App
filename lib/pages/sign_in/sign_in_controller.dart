import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace_flutter/common/entities/entities.dart';
import 'package:workspace_flutter/common/global_loader/global_loader.dart';
import 'package:workspace_flutter/common/utils/constants.dart';

import '../../common/widgets/popup_messages.dart';
import '../../global.dart';
import 'notifier/sign_in_notifier.dart';

class SignInController {
  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Please enter your email");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Please enter your password");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoader(true);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        toastInfo("Sign In Successful");
      }

      if (credential.user == null) {
        toastInfo("User not found");
        return;
      }

      if (!credential.user!.emailVerified) {
        toastInfo("Please verify your email");
        return;
      }

      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        if (kDebugMode) {
          print("User Logged in successfully");
        }
      } else {
        toastInfo("Login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        toastInfo('Wrong password provided for that user.');
      } else if (e.code == 'network-request-failed') {
        toastInfo(
            'Network error occurred. Please check your internet connection and try again.');
      } else {
        toastInfo('Login failed: ${e.message}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      toastInfo('An error occurred. Please try again.');
    }

    ref.read(appLoaderProvider.notifier).setLoader(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    //we need to talk to the server

    // have local storage
    try {
      var navigator = Navigator.of(ref.context);
      //Remember user info
      Global.storageService
          .setString(AppContants.STORAGE_USER_PROFILE_KEY, "231134455");
      Global.storageService
          .setString(AppContants.STORAGE_USER_TOKEN_KEY, "231894401");

      navigator.pushNamedAndRemoveUntil("/application", (route) => false);

      // navigator.pushNamed("/application", );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //redirect to new page
  }
}
