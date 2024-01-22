import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/account_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/dashboard_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/detail_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/home_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/search_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/webview_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_welcome/login_controller.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_welcome/register_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<searchController>(
      () => searchController(),
    );
    Get.lazyPut<WebViewController>(
      () => WebViewController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
