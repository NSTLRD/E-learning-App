import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/utils/app_colors.dart';

Widget text24Normal({String text="", Color color = AppColors.primaryText}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.bold,
    )
  );
}

Widget text16Normal({String text="", Color color = AppColors.primarySecondaryElementText}){
  return  Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.bold,
      )
  );
}

