import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/detail_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
