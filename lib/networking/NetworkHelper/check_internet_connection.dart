import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_structure/utils/dialog/alert_dialog.dart';

Future<bool?> isNetworkAvailable(BuildContext context)async{
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    showAlertDialog(context, "Oops", "Please check your network connectivity.", "Ok");
    return false;
  }
  return null;
}

