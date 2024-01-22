import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    
  }
}
