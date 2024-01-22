import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  late Client client;
  late Account account;

  RxBool isLoading = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxString userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566f487a71eca924482');

    account = Account(client);
  }

  String generateRandomString() {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-';
    final random = Random();
    return List.generate(
        36, (index) => characters[random.nextInt(characters.length)]).join();
  }

  void onSignUp() {
    if (name.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan Nama",
        backgroundColor: Colors.yellow[600],
      );
    } else if (email.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan Email",
        backgroundColor: Colors.yellow[600],
      );
    } else if (password.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan Password",
        backgroundColor: Colors.yellow[600],
      );
    } else if (confirmPassword.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan Ulang Password",
        backgroundColor: Colors.yellow[600],
      );
    } else if (password.text != confirmPassword.text) {
      Fluttertoast.showToast(
        msg: "Copas Ae Bro",
        backgroundColor: Colors.yellow[600],
      );
    } else {
      register();
      Fluttertoast.showToast(
        msg: "Success",
        backgroundColor: Colors.green[600],
      );

      Get.toNamed('/login');
    }
  }

  Future<void> register() async {
    try {
      isLoading.value = true;

      final result = await account.create(
        email: email.text,
        password: password.text,
        name: name.text,
        userId: generateRandomString(),
      );

      // Handle successful registration, e.g., navigate to the login screen
      print('Registration successful');
      print(result);

      // TODO: Add your navigation logic here
    } catch (error) {
      Get.defaultDialog(
        title: 'Error',
        content: Text('$error'),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
