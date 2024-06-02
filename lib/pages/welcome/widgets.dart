

import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/widgets/app_shadow.dart';
import '../../common/widgets/text_widgets.dart';
import '../sign_in/sign_in.dart';

Widget appOnboardingPage(
    PageController controller,
    {
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subtitle = "",
  index = 0, required BuildContext context,
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
    _nextButton(index, controller, context)
  ]);
}


//Next Button
Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
    if(index<3) {
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,);
      }else{
      //Navigate to next screen
      Navigator.pushNamed(
          context,
          "/sign_In",
      );
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => const SignIn(),
      //   ),
      // );
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
