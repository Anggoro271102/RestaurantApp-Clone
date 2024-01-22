import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/wishlist_controller.dart';
import 'package:get/get.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishListController>(
      () => WishListController(),
    );
  }
}
