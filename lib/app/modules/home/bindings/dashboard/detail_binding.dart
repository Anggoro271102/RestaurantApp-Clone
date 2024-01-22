import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/detail_controller.dart';
import 'package:get/get.dart';

class DetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
