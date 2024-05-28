import 'package:flutter/cupertino.dart';

import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage({
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subtitle = "",
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
  ]);
}
