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