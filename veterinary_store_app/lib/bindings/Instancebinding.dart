import 'package:veterinary_store_app/controllers/auth_controller.dart';
import 'package:veterinary_store_app/controllers/utilities_controller.dart';
import 'package:veterinary_store_app/controllers/product_controller.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    // eager-loading authController and ContactController, also marking them as permanent
    // so that the same instance is available on different screens when we call Get.find() method
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<UtilitiesController>(UtilitiesController(), permanent: true);
    // Get.put<ContactController>(ContactController(), permanent: true);
    // Get.lazyPut<UploadController>(() => UploadController(), fenix: false);
  }
}
