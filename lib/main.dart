import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/error_screen.dart';
import 'ui/intro_screen/splash_page.dart';
import 'utils/navigate_service.dart';
import 'utils/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigateService>().key,
      routes: {
        '/ErrorScreen': (_) => ErrorScreen(),
      },
      title: 'Bee',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
