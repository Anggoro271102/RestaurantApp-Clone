import 'package:get/get.dart';

class WebViewController extends GetxController {
  var url =
      'https://www.tripadvisor.co.id/Restaurants-g297710-Malang_East_Java_Java.html'
          .obs;

  void updateUrl(String newUrl) {
    url.value = newUrl;
  } // Replace with the initial URL
}
