import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/constants/app_images.dart';
import 'package:flutter_project_structure/utils/common_controller/bottom_tab_bar_controller.dart';
import 'package:get/get.dart';

class CustomBottomTabBar extends StatelessWidget {

  CustomBottomTabBar({Key? key}) : super(key: key);

  final bottomTabController = Get.put(BottomTabController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Get.isDarkMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);
    final appSize = MediaQuery.of(context).size;
    double bottomBgHeight =  Platform.isAndroid == true ? 80 : 130;
    Widget _icon(String icon, int index, {Color? iconColor, double size = 25}) {
      return Expanded(
        child: GestureDetector(
          onTap: () {bottomTabController.onIconTap(index);},
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: index == -1 ?null:const EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Image.asset(icon, height: size, width: size, fit: BoxFit.contain, color: iconColor),
                    // child: SvgPicture.asset(icon, height: size, width: size, fit: BoxFit.contain, color: iconColor),
                  ),
                  Positioned(
                      top: 0, right: 3,
                      child: index == 2 && bottomTabController.isNotificationArrived.isTrue ? Container(height:8,width:8,decoration: BoxDecoration(color: Colors.green.withOpacity(0.5),shape: BoxShape.circle),) : Container()),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox(
          width: appSize.width,
          height: bottomBgHeight,
          child: Obx(() =>
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0)),
                    color: const Color(0xffF2F2F2),
                    boxShadow: [ BoxShadow(spreadRadius:1,blurRadius: 12,color: Colors.black.withOpacity(0.2)) ],
                  ),
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _icon(AppImages.homeIconPng, 0, iconColor: bottomTabController.selectedTabIndex.value == 0 ? Colors.red : Colors.blueGrey, size: 27),
                      _icon(AppImages.favouriteIconPng, 1, iconColor: bottomTabController.selectedTabIndex.value == 1 ? Colors.red : Colors.blueGrey, size: 27),
                      _icon(AppImages.settingIconPng, 2, iconColor: bottomTabController.selectedTabIndex.value == 2 ? Colors.red : Colors.blueGrey, size: 27),
                      _icon(AppImages.profileIconPng, 3, iconColor: bottomTabController.selectedTabIndex.value == 3 ? Colors.red : Colors.blueGrey, size: 27),
                    ],
                  ),
                ),
            ),
        );
  }
}