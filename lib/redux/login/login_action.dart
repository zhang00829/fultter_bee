import 'package:Bee/model/login_model.dart';
import 'package:flutter/material.dart';

class UpdateLoginAction{
  final LoginModel loginModel;

  UpdateLoginAction(this.loginModel);
  toJson() {
    return {'loginModel': loginModel};
  }
}

class InitTextControllerAction{
  final TextEditingController textEditingController;

  InitTextControllerAction(this.textEditingController);
}

