import 'package:flutter_project_structure/screens/main_screen/favourite_screen/favourite_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/home_screen/home_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/main_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/profile_screen/profile_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/setting_screen/setting_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const homeScreen = "/homeScreen";
  static const mainScreen = "/mainScreen";
  static const profileScreen = "/profileScreen";
  static const settingScreen = "/settingScreen";
  static const favouriteScreen = "/favouriteScreen";

  static final routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: mainScreen, page: () => const MainScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: favouriteScreen, page: () => const FavouriteScreen()),
    GetPage(name: settingScreen, page: () => const SettingScreen()),
  ];

}