import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleTheme {
  static TextStyle customTextStyle(
      Color color, double size, FontWeight fontWeight,
      {TextDecoration? decoration,String? fontFamily,bool useResponsive = false,bool useScaler = true, double? spacing}) {
    // size = useResponsive?ScreenUtil().setSp(size):size;
    return TextStyle(
        fontFamily: fontFamily ?? "Avenir",
        color: color,
        fontSize: size,
        // fontSize: ScreenUtil().setSp(size),
        fontWeight: fontWeight,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: spacing ?? 0);
  }
}


