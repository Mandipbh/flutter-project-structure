import 'package:flutter/material.dart';
import 'package:flutter_project_structure/constant/app_routes.dart';
import 'package:flutter_project_structure/utils/buttons/custom_button.dart';
import 'package:flutter_project_structure/utils/dimesions/dimensions.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        Dimensions.init(context); 
        return GetMaterialApp(
          initialRoute: AppRoutes.mainScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
