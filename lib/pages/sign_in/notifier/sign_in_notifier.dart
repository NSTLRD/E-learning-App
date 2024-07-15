import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace_flutter/pages/sign_in/notifier/sign_in_state.dart';


//StateNotifier saves state and notifies listeners when the state changes
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(SignInState());


  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref){
  return SignInNotifier();
});