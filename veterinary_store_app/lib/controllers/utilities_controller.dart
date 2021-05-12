import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilitiesController extends GetxController {
  var tabIndex = 0;
  var titleScreen = "Veterinary Store";
  String selectRadioPayment = "Cash";
  String selectRadioShipping = "Self-Shop Ship";
  bool showPass = false;

  void changeTabIndex(int index) {
    tabIndex = index;
    if(index == 0){titleScreen = 'Veterinary Store';}
    else if(index == 1){titleScreen = 'HealthCare';}
    else if(index == 2){titleScreen = 'User Information';}
    else if(index == 3){titleScreen = 'Cart';}
    update();
  }

  void showPassword(){
    showPass = !showPass;
    update();
  }

  void updateScreen(){
    update();
  }

  setSelectRadioPayment(String val){
    selectRadioPayment = val;
    update();
  }

  setSelectRadioShipping(String val){
    selectRadioShipping = val;
    update();
  }

}

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  static int index = 0;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All',),
    Tab(text: 'Waiting',),
    Tab(text: 'Complete',),
    Tab(text: 'Cancel',),
  ];

  TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(initialIndex:  MyTabController.index ,vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}