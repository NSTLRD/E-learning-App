import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace_flutter/common/global_loader/global_loader.dart';
import 'package:workspace_flutter/common/utils/app_colors.dart';
import 'package:workspace_flutter/pages/sign_up/notifier/register_notifier.dart';
import 'package:workspace_flutter/pages/sign_up/sign_up_controller.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_tesxtfields.dart';
import '../../common/widgets/button_widgets.dart';
import '../../common/widgets/text_widgets.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regProvider.copyWith();
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(title: "Sign Up"),
            backgroundColor: Colors.white,
            body: loader== false ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                      child: text14Normal(
                          text: "Enter your details below and free sign up")),
                  SizedBox(
                    height: 50.h,
                  ),
                  //username text box
                  appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your username",
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserNameChange(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //email text box
                  appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address",
                    func: (value) =>  ref
                        .read(registerNotifierProvider.notifier)
                        .onEmailChange(value),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  //password text box
                  appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true,
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onPasswordChange(value),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //confirm password text box
                  appTextField(
                    text: "Confirm Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your Confirm password",
                    obscureText: true,
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onConfirmPasswordChange(value),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  //forgot text
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: text14Normal(
                          text:
                              "By creating an account, you agree to our Terms of Service and Privacy Policy")),
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                      child: appButton(
                    buttonName: "Register",
                    isLogin: true,
                    context: context,
                    func: () => _controller.handleSignUp(),
                  ))
                  //app register button
                ],
              ),
            ):const Center(child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: AppColors.primaryElement,
            )),
      ),
      ),
    );
  }
}
