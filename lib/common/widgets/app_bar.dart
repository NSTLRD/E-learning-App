

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace_flutter/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space

 */

AppBar buildAppbar({String title = ""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        height: 1,
      ),
    ),
    title: text16Normal(text: title, color: AppColors.primaryText),
    centerTitle: true,
  );
}