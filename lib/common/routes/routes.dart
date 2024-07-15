import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/routes/app_routes_names.dart';
import 'package:workspace_flutter/pages/sign_in/sign_in.dart';
import 'package:workspace_flutter/pages/sign_up/sign_up.dart';
import 'package:workspace_flutter/pages/welcome/welcome.dart';

import '../../global.dart';
import '../../pages/application/application.dart';

class AppPages {

  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRouteNames.WELCOME, page: const Welcome()),
      RouteEntity(path: AppRouteNames.SIGNIN, page: const SignIn()),
      RouteEntity(path: AppRouteNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRouteNames.APPLICATION, page: const Application()),


    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route name: ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        //if we used this is first time or not
        bool isDeviceFirstTime = Global.storageService.getDeviceFirstOpen();

        if (result.first.path == AppRouteNames.WELCOME&&isDeviceFirstTime) {

          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Application(),
                settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const SignIn(),
                settings: settings);
          }
        }else{
          if(kDebugMode){
            print("App ran first time");
          }
          return MaterialPageRoute(
              builder: (_) => result.first.page,
              settings: settings);
        }
      }
    }
      return MaterialPageRoute(
          builder: (_) => const Welcome(),
          settings: settings
      );
    }
  }


  class RouteEntity{
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
  }
