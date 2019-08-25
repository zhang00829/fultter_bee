

import 'package:Bee/net/account_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AccountEntity") {
      return AccountEntity.fromJson(json) as T;
    }  else {
      return null;
    }
  }
}