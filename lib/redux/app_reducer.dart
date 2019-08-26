import 'app_state.dart';
import 'login/login_reducer.dart';

AppState appReducer (AppState pre,dynamic action ){
  return AppState(loginReducer(pre.loginState,action));
}