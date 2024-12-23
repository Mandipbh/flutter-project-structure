import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/common_widgets/bottom_tab_bar.dart';
import 'package:flutter_project_structure/screens/main_screen/favourite_screen/favourite_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/home_screen/home_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/profile_screen/profile_screen.dart';
import 'package:flutter_project_structure/screens/main_screen/setting_screen/setting_screen.dart';
import 'package:flutter_project_structure/utils/common_controller/bottom_tab_bar_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final bottomTabController = Get.put(BottomTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ExpandablePageView(
          controller: bottomTabPageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            FavouriteScreen(),
            SettingScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomTabBar(),
    );
  }
}
