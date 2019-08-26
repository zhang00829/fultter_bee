
import 'package:Bee/common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:common_utils/common_utils.dart';

class Log{

  static const perform = const MethodChannel("x_log");

  static d(String msg, {tag: 'X-LOG'}) {
    if (!Constant.inProduction){
      _print(msg, tag: tag);
    }
  }

  static w(String msg, {tag: 'X-LOG'}) {
    if (!Constant.inProduction){
      _print(msg, tag: tag);
    }
  }

  static i(String msg, {tag: 'X-LOG'}) {
    if (!Constant.inProduction){
      _print(msg, tag: tag);
    }
  }

  static e(String msg, {tag: 'X-LOG'}) {
    if (!Constant.inProduction){
      _print(msg, tag: tag);
    }
  }

  static json(String msg, {tag: 'X-LOG'}) {
    if (!Constant.inProduction){
      _print(msg, tag: tag);
    }
  }

  static _print(String msg, {tag: 'X-LOG'}){
    if (defaultTargetPlatform == TargetPlatform.iOS){
      LogUtil.debuggable = !Constant.inProduction;
      LogUtil.v(msg, tag: tag);
    }
  }
}