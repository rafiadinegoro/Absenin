import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Style {
  static Color mainColor = const Color(0xFFF6F8FF);
  static Color secondColor = const Color(0xFF00283B);
  static Color thirdColor = const Color(0xFFC0DBCE);
  static Color text1Color = const Color(0xFFFFFFFF);
  static Color text2Color = const Color(0xFF14161E);
  static Color text3Color = const Color(0xFF43936C);
  static Color text4Color = const Color(0xFF8D92A3);
  static Color text5Color = const Color(0xFFC4C4C4);
  static Color text6Color = const Color(0xff007B55);
  static Color text7Color = const Color(0xffEB1616);
  static Color text8Color = const Color(0xffFFE390);
  static String font = "Konnect";

  static appbarCustom(String text) => AppBar(
        backgroundColor: Style.secondColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Style.text2Color,
            )),
        title: Text(
          text,
          style: TextStyle(
              color: Style.text2Color,
              fontFamily: Style.font,
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      );
}
