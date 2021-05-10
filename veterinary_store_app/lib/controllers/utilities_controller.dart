import 'package:get/get.dart';

class UtilitiesController extends GetxController {
  var tabIndex = 0;
  var titleScreen = "Veterinary Store";
  String selectRadio = "Cash";
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

  setSelectRadio(String val){
      selectRadio = val;
      update();
  }

}