import 'dart:io';

import 'package:Bee/redux/app_state.dart';
import 'package:Bee/redux/store.dart';
import 'package:Bee/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'ui/error_screen.dart';
import 'ui/intro_screen/splash_page.dart';
import 'utils/navigate_service.dart';
import 'utils/service_locator.dart';
import 'package:oktoast/oktoast.dart';


void main() async{
  setupLocator();
  Store<AppState> store = await createStore();


  runApp(MyApp(store: store,));
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final  store;

  const MyApp({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      backgroundColor: Colors.grey,
      radius: 10.0,
      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          navigatorKey: getIt<NavigateService>().key,
          routes: {
            '/ErrorScreen': (_) => ErrorScreen(),
          },
          theme: ThemeData(
              primaryColor: Colours.app_main,
              scaffoldBackgroundColor: Colors.white),
          title: 'Bee',
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        ),
      ),
    );
  }
}
