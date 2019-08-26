import 'package:Bee/common/common.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './app_reducer.dart';
import 'app_state.dart';

import 'package:redux_dev_tools/redux_dev_tools.dart';

createStore() async {
  if (!Constant.inProduction) {
    var remoteDevtools = RemoteDevToolsMiddleware('127.0.0.1:8000');
    await remoteDevtools.connect();
    final Store<AppState> store = new DevToolsStore<AppState>(appReducer,
        initialState: AppState.initial(),
        middleware: [remoteDevtools, thunkMiddleware]);
    remoteDevtools.store = store;
    return store;
  } else {
    return Store<AppState>(appReducer,
        initialState: AppState.initial(), middleware: [thunkMiddleware]);
  }
}
