import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/pages/welcome/widgets.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (index) {
                    setState(() {
                      // _currentIndex = index;
                    });
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Page 1
                    appOnboardingPage(
                        _controller,
                        imagePath: "assets/images/reading.png",
                        title: "Bienvenidos a Elearning App",
                        subtitle:
                        "Una aplicación para aprender de forma rápida y sencilla", index: 1),
                    // Page 2
                    appOnboardingPage(
                        _controller,
                        imagePath: "assets/images/man.png",
                        title: "siendo tus mejores aliados",
                        subtitle:
                        "Descubre una nueva forma de aprender con Elearning App", index: 2),
                    // Page 3
                    appOnboardingPage(
                        _controller,
                        imagePath: "assets/images/boy.png",
                        title: "Mantente actualizado",
                        subtitle:
                        "Desde cursos básicos hasta avanzados, tenemos todo lo que necesitas", index: 3),
                  ],
                ),
                //showing dots for page indicator
                 Positioned(
                  // left: 20,
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator:  DotsDecorator(size: Size.square(9.0),
                    color: Colors.grey, // Inactive color
                    activeColor: Colors.blue,
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)
                  ),
                  ),
                ),
                 ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
