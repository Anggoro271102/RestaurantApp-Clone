import 'package:flutter_application_1/app/modules/home/controllers/controller_welcome/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}
