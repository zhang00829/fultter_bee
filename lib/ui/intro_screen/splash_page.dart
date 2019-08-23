import 'package:Bee/common/common.dart';
import 'package:Bee/ui/index/index.dart';
import 'package:Bee/utils/navigate_service.dart';
import 'package:Bee/utils/service_locator.dart';
import 'package:Bee/utils/utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showIntroScreen=false;

  List<Slide> slides = [
    Slide(
      title: "ERASER",
      description:
          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
      pathImage: "assets/images/intro_screen/photo_eraser.png",
      backgroundColor: Color(0xfff5a623),
    ),
    Slide(
      title: "PENCIL",
      description: "Ye indulgence unreserved connection alteration appearance",
      pathImage: "assets/images/intro_screen/photo_pencil.png",
      backgroundColor: Color(0xff203152),
    ),
    Slide(
      title: "RULER",
      description:
          "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
      pathImage: "assets/images/intro_screen/photo_ruler.png",
      backgroundColor: Color(0xff9932CC),
    )
  ];

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (SpUtil.getBool(Constant.key_guide, defValue: true)) {
      SpUtil.putBool(Constant.key_guide, false);
      setState(() {
        _showIntroScreen=true;
      });
    } else {
      Future.delayed(Duration(seconds: 3),()=>_goLogin());

    }
  }

  void _goLogin() {
    getIt<NavigateService>().pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Index()), (route) => route == null);
  }

  void onDonePress() {
    toIndex();
  }

  void onSkipPress() {
    toIndex();
  }

  void toIndex() {
    getIt<NavigateService>().pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Index()), (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return _showIntroScreen?IntroSlider(
      colorDot: Colors.white,
      colorActiveDot: Colors.red,
      slides: slides,
      onDonePress: onDonePress,
      onSkipPress: onSkipPress,
    ):Container(child: Image.asset(
      Utils.getImgPath("intro_screen/screen", format: "png"),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    ),);
  }
}
