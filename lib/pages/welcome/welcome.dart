import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace_flutter/pages/welcome/widgets.dart';

final indexProvider = StateProvider<int>((ref) {
  return 0;
});

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _controller = PageController();

    final index = ref.watch(indexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexProvider.notifier).state = value;
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/reading.png",
                        title: "Bienvenidos a Elearning App",
                        subtitle:
                            "Una aplicación para aprender de forma rápida y sencilla",
                        index: 1,
                        context: context),
                    // Page 2
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/man.png",
                        title: "siendo tus mejores aliados",
                        subtitle:
                            "Descubre una nueva forma de aprender con Elearning App",
                        index: 2,
                        context: context),
                    // Page 3
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/boy.png",
                        title: "Mantente actualizado",
                        subtitle:
                            "Desde cursos básicos hasta avanzados, tenemos todo lo que necesitas",
                        index: 3,
                        context: context),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
