import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<searchController>(
      () => searchController(),
    );
  }
}
