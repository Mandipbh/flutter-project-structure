import 'package:flutter/material.dart';
import 'package:get/get.dart';

PageController bottomTabPageController = PageController(initialPage: 0,keepPage: false);

class BottomTabController extends GetxController{

  var isNotificationArrived = false.obs;
  final selectedBottomTab = 0.obs;
  final selectedTabIndex = 0.obs;
  var isSelectFriendScreen = false.obs;

  void onIconTap(int? index) {
    selectedTabIndex.value = index ?? 0;
    update();
    selectedBottomTab(index);
    if(bottomTabPageController.hasClients) {
      bottomTabPageController.jumpToPage(selectedBottomTab.value);
    }
  }

  redirectGroupScreen(){
    selectedBottomTab.value = 0;
    bottomTabPageController.jumpToPage(selectedBottomTab.value);
    update();
  }

  navigateToMainAtPage({int pageIndex = 1, int popCount = 1}){
    Get.until((route) => Get.currentRoute == '/main');
    selectedBottomTab.value = pageIndex;
    bottomTabPageController.jumpToPage(selectedBottomTab.value);
  }

  @override
  void onInit() {
    bottomTabPageController.addListener(() {
      update();
    });
    super.onInit();
  }

}