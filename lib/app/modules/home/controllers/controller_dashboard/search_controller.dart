import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class searchController extends GetxController {
  final isLoading = true.obs;
  final hasError = false.obs;
  final error = ''.obs;
  final restaurantList = List<Map<String, dynamic>>.empty().obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://restaurant-api.dicoding.dev/search?q=$searchText'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        restaurantList.value =
            List<Map<String, dynamic>>.from(data['restaurants']);
      } else if (response.statusCode >= 500 && response.statusCode <= 599) {
        hasError.value = true;
        error.value = 'Masalah Sever Bro';
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        hasError.value = true;
        error.value = 'Client Error';
      } else if (response.statusCode >= 300 && response.statusCode <= 399) {
        hasError.value = true;
        error.value = 'Redirection Error';
      } else {
        hasError.value = true;
        error.value = 'Error to Load Data';
      }
    } catch (e) {
      hasError.value = true;
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
