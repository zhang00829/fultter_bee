import 'package:Bee/ui/widgets/app_bar.dart';
import 'package:Bee/utils/navigate_service.dart';
import 'package:Bee/utils/service_locator.dart';
import 'package:flutter/material.dart';


class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text('index'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getIt<NavigateService>().pushNamed('/ErrorScreen');
      }),
    );
  }
}
