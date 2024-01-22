import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/webview_controller.dart';
import 'package:get/get.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewController>(
      () => WebViewController(),
    );
  }
}
