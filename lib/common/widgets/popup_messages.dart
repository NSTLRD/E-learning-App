import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//toast message with positioanl optional parameter
toastInfo([String msg=""]){
  return Fluttertoast.showToast(
  msg: msg,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP,
  timeInSecForIosWeb: 3,
  backgroundColor: Colors.amber,
  textColor: Colors.black87,
  fontSize: 18.sp,
  );
}