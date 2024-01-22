import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxString userId = ''.obs;

  // Metode untuk menyimpan User ID setelah login
  void setUserId(String newUserId) {
    userId.value = newUserId;
    saveUserIdToPreferences(newUserId);
  }

  // Metode untuk menyimpan User ID ke Shared Preferences
  Future<void> saveUserIdToPreferences(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', userId);
  }

  // Metode untuk mendapatkan informasi pengguna atau login jika belum
  // Future<void> signInOrGetUserInfo() async {
  //   User? user = _auth.currentUser;

  //   if (user == null) {
  //     // Jika pengguna belum login, lakukan proses login
  //     UserCredential userCredential = await _auth.signInAnonymously();
  //     user = userCredential.user;
  //   }

  //   // Set User ID ke dalam GetX Controller
  //   setUserId(user?.uid ?? '');
  // }
}

class LoginController extends GetxController {
  late Client client;
  late Account account;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  RxString userId = ''.obs;
  final UserController userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566f487a71eca924482');

    account = Account(client);
  }

  Future<void> onLogin() async {
    if (email.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan Email",
        backgroundColor: Colors.red[600],
      );
    } else if (password.text == '') {
      Fluttertoast.showToast(
        msg: "Masukkan password",
        backgroundColor: Colors.red[600],
      );
    } else {
      // await signIn(email.text, password.text);
      login();
      getUserId();
    }
  }

  Future<void> login() async {
    try {
      isLoading.value = true;

      final result = await account.createEmailSession(
        email: email.text,
        password: password.text,
      );

      final prefs = await account.get();
      String? name = prefs.email;

      // Handle successful registration, e.g., navigate to the login screen
      print('Login successful');
      print(name);
      print(result);
      Get.offAndToNamed('/dashboard');
    } catch (error) {
      Get.defaultDialog(
        title: 'Error',
        content: Text('$error'),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUserId() async {
    try {
      final response = await account.getPrefs();
      final userId = response.data['id'];
      return userId;
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Future<void> signIn(String email, String password) async {
  //   try {
  //       await auth.signInWithEmailAndPassword(email: email, password: password);

  //     Fluttertoast.showToast(
  //       msg: "Login successful",
  //       backgroundColor: Colors.green[600],
  //     );

  //     await userController.signInOrGetUserInfo();

  //     // Dapatkan User ID dari UserController
  //     String userId = userController.userId.value;
  //     print("User ID from Firebase: $userId");

  //     Get.offAllNamed('/dashboard');
  //   } on FirebaseAuthException catch (ex) {
  //     if (ex.code == "user-not-found") {
  //       Fluttertoast.showToast(
  //         msg: "Email id dose not exists",
  //         backgroundColor: Colors.red[400],
  //       );
  //     } else if (ex.code == "wrong-password") {
  //       Fluttertoast.showToast(
  //         msg: "Wrong password",
  //         backgroundColor: Colors.red[400],
  //       );
  //     }
  //   }
  // }
}
