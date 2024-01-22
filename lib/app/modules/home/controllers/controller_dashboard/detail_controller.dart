import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  // Variabel untuk menyimpan informasi restoran
  var idRestaurant = ''.obs;
  final isLoading = true.obs;
  final hasError = false.obs;
  final error = ''.obs;
  var message = ''.obs;
  var restaurantId = ''.obs;
  var restaurantName = ''.obs;
  var restaurantDescription = ''.obs;
  var restaurantCity = ''.obs;
  var restaurantAddress = ''.obs;
  var restaurantPictureId = ''.obs;
  var restaurantRating = 0.0.obs;
  var restaurantCategories = <String>[].obs;
  var restaurantFoods = <String>[].obs;
  var restaurantDrinks = <String>[].obs;
  var reviews = <String>[].obs;

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://restaurant-api.dicoding.dev/detail/$idRestaurant'),
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        message.value = decodedData['message'];
        final Map<String, dynamic> restaurant = decodedData['restaurant'];

        restaurantId.value = restaurant['id'];
        restaurantName.value = restaurant['name'];
        restaurantDescription.value = restaurant['description'];
        restaurantCity.value = restaurant['city'];
        restaurantAddress.value = restaurant['address'];
        restaurantPictureId.value = restaurant['pictureId'];
        restaurantRating.value = restaurant['rating'].toDouble();
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
