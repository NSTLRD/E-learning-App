import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text24Normal({String text=""}){
  return  Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    )
  );
}

Widget text16Normal({String text=""}){
  return  Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )
  );
}