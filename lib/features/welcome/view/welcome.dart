import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace_flutter/features/welcome/view/widgets/widgets.dart';

import '../provider/welcome_notifier.dart';


//final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();
 // int dotsIndex=0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   // print('my dots value is $dotsIndex');
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value){
                    print('----my index value is $value');
                   // dotsIndex=value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  //scrollBehavior: AxisDirection.up,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //first page
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/reading.png",
                        title: "Bienvenidos a Elearning App",
                        subTitle:
                            "Una aplicación para aprender de forma rápida y sencilla",
                        index: 1, context:context),
                    //second page
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/man.png",
                        title: "siendo tus mejores aliados",
                        subTitle:
                            "Descubre una nueva forma de aprender con Elearning App",
                        index: 2, context:context),
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/boy.png",
                        title: "Mantente actualizado",
                        subTitle:
                            "Desde cursos básicos hasta avanzados, tenemos todo lo que necesitas",
                        index: 3, context:context)
                  ],
                ),
                //for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w)
                      )
                    ),
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
