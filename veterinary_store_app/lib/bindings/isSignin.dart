import 'package:flutter/material.dart';
import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/screens/app_screen.dart';
import 'package:veterinary_store_app/screens/signin_screen.dart';
import 'package:get/get.dart';

class IsSignedIn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Get.find<AuthController>().user!=null ? AppScreen() : SignIn();
    });
  }
}

