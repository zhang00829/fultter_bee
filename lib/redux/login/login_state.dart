import 'package:flutter/material.dart';

import 'package:Bee/model/login_model.dart';

class LoginState{
  LoginModel loginModel;
  TextEditingController numController ;
  LoginState(this.loginModel,this.numController);

  factory LoginState.initial(){
    return LoginState(null,null);
  }
  toJson(){
    return {'loginModel':loginModel.toJson(),'numController':numController.toString()};
  }
}