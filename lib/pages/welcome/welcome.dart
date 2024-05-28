import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/widgets/text_widgets.dart';
import 'package:workspace_flutter/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: [
              // Page 1
              appOnboardingPage(
                  imagePath: "assets/images/reading.png",
                  title: "Bienvenidos a Elearning App",
                  subtitle:
                      "Una aplicación para aprender de forma rápida y sencilla"),
              // Page 2
              appOnboardingPage(
                  imagePath: "assets/images/man.png",
                  title: "siendo tus mejores aliados",
                  subtitle:
                      "Descubre una nueva forma de aprender con Elearning App"),
              // Page 3
            ],
          ),
          const Positioned(
            left: 20,
            bottom: 100,
            child: Text('Wigedt one'),
          ),
        ],
      ),
    );
  }
}
