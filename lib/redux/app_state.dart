import 'login/login_state.dart';

class AppState {
  LoginState loginState;

  AppState(this.loginState);

  factory AppState.initial() {
    return AppState(LoginState.initial());
  }
}
