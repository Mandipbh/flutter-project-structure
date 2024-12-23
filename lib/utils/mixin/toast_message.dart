import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///ShowToast
showToast(BuildContext context, String msg, Toast toast,
    {Color? backGroundColor, Color? textColor}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toast,
      textColor: textColor ?? Colors.white,
      backgroundColor: backGroundColor ?? Colors.blue);
}
