import 'login_action.dart';
import 'login_state.dart';

LoginState loginReducer(LoginState pre,dynamic action){
  if(action is UpdateLoginAction){
    return  LoginState(action.loginModel,pre.numController);
  }
  if(action is InitTextControllerAction){
    return LoginState(pre.loginModel, action.textEditingController);
  }
  return pre;
}