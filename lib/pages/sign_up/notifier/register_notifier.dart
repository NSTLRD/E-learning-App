
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:workspace_flutter/pages/sign_up/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {

  @override
  RegisterState build() {
    return RegisterState();
  }

  //register the value in state
 void onUserNameChange(String name) {
    state = state.copyWith(userName: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onConfirmPasswordChange(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }


}