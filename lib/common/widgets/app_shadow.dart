import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/utils/app_colors.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double blurRadius = 15,
    double spRadius = 1}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(blurRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          spreadRadius: spRadius,
          blurRadius: blurRadius,
          offset: const Offset(0, 5),
        ),
      ]);
}
