class SignInState {
  final String email;
  final String password;

  SignInState({this.email = "", this.password = ""});

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}

