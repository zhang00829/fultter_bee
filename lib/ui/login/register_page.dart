


import 'package:Bee/res/styles.dart';
import 'package:Bee/ui/widgets/app_bar.dart';
import 'package:Bee/ui/widgets/my_button.dart';
import 'package:Bee/ui/widgets/text_field.dart';
import 'package:Bee/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:oktoast/oktoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  KeyboardActionsConfig _config;
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变  
    _nameController.addListener(_verify);
    _vCodeController.addListener(_verify);
    _passwordController.addListener(_verify);
    _config = Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2, _nodeText3]);
  }

  void _verify(){
    String name = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 11) {
      isClick = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      isClick = false;
    }
    if (password.isEmpty || password.length < 6) {
      isClick = false;
    }
    if (isClick != _isClick){
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _register(){
    showToast("确认......");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "注册",
        ),
        body: defaultTargetPlatform == TargetPlatform.iOS ? FormKeyboardActions(
          child: _buildBody(),
        ) : SingleChildScrollView(
          child: _buildBody(),
        )
    );
  }

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "开启你的账号",
            style: TextStyles.textBoldDark26,
          ),
          Gaps.vGap16,
          MyTextField(
            focusNode: _nodeText1,
            config: _config,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入手机号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText2,
            controller: _vCodeController,
            keyboardType: TextInputType.number,
            getVCode: () async {
              if (_nameController.text.length == 11){
                showToast("并没有真正发送哦，直接登录吧！");
                /// 一般可以在这里发送真正的请求，请求成功返回true
                return true;
              }else{
                showToast('请输入有效的手机号');
                return false;
              }
            },
            maxLength: 6,
            hintText: "请输入验证码",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText3,
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _isClick ? _register : null,
            text: "注册",
          )
        ],
      ),
    );
  }
}
