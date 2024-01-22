import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final hasError = false.obs;
  final error = ''.obs;
  RxString username = 'Guest'.obs;
  final restaurantList = List<Map<String, dynamic>>.empty().obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }



  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://restaurant-api.dicoding.dev/list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        restaurantList.value =
            List<Map<String, dynamic>>.from(data['restaurants']);
      } else {
        hasError.value = true;
        error.value = 'Failed to load data';
      }
    } catch (e) {
      hasError.value = true;
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
