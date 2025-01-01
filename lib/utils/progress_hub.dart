import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showProgressThreeDots(BuildContext context,{Color? loaderColor}) {
  showDialog(
      barrierDismissible: false,
      context: Get.context ?? context,
      builder: (_) => WillPopScope(
            onWillPop: () async => false,
            child: SpinKitThreeBounce(
              color: loaderColor ?? Colors.blue,
              size: 25,
            ),
          ));
}

hideProgress(BuildContext context) async {
  Get.back();
}
