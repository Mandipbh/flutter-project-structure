import 'package:flutter/material.dart';
import 'package:flutter_project_structure/constants/app_routes.dart';
import 'package:flutter_project_structure/network/connectivity.dart';
import 'package:flutter_project_structure/shared/storage_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  await Get.putAsync(() => localStorage.init());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // static void setLocale(BuildContext context, Locale locale) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state?.changeLocale(locale);
  // }
}

class _MyAppState extends State<MyApp> {
  // Locale _locale = Locale('en'); // Default language is English

  // void changeLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return NetworkAwareWidget(
      child: GetMaterialApp(
        locale: const Locale('en', 'US'), // app language
        fallbackLocale: const Locale('fr', 'FR'),
        initialRoute: AppRoutes.mainScreen,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
