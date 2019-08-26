import 'package:Bee/model/login_model.dart';
import 'package:Bee/net/net.dart';
import 'package:Bee/redux/login/login_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../app_state.dart';
import 'login_action.dart';

ThunkAction<AppState> ajaxLogin() {
  return (Store<AppState> store) async {
    Map<String, dynamic> params = {"username": "admin", "password": "admin"};
//    var res = await DioUtils.instance
//        .request<LoginModel>(Method.post, Api.login, params: params);
    store.dispatch(UpdateLoginAction(LoginModel(token: 'token12346798')));
  };
}


