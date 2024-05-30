import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/widgets/app_shadow.dart';
import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(
    PageController controller,
    {
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subtitle = "",
  index = 0,
}) {

  return Column(children: [
    Image.asset(imagePath, fit: BoxFit.fitWidth),
    Container(
      padding: const EdgeInsets.only(top: 15),
      child: text24Normal(text: title),
    ),
    Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: text16Normal(
          text: subtitle),
    ),
    _nextButton(index, controller)
  ]);
}


//Next Button
Widget _nextButton(int index, PageController controller) {
  return GestureDetector(
    onTap: () {
    if(index<3) {
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
          child: text16Normal(
              text: index < 3 ? "Continuar" : "Empecemos", color: Colors.white)),
    ),
  );
}
