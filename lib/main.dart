import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/bindings/dashboard/dashboard_binding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/dashboard/detail_binding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/welcome/login_binding.dart';
import 'package:flutter_application_1/app/modules/home/bindings/welcome/register_bining.dart';
import 'package:flutter_application_1/app/modules/home/bindings/welcome/welcome_binding.dart';
import 'package:flutter_application_1/app/modules/home/views/dashboard_view.dart';
import 'package:flutter_application_1/app/modules/home/views/detail_view.dart';
import 'package:flutter_application_1/app/welcome_page/login_page.dart';
import 'package:flutter_application_1/app/welcome_page/register_page.dart';
import 'package:flutter_application_1/app/welcome_page/welcome_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FLutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const WelcomePage(),
          binding: WelcomeBinding(),
        ),
        GetPage(
            name: '/dashboard',
            page: () => const DashBoardPage(),
            binding: DashBoardBinding()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding: LoginBinding()),
        GetPage(
            name: '/detail',
            page: () => const DetailView(),
            binding: DetailProductBinding()),
        GetPage(
            name: '/register',
            page: () => const RegisterPage(),
            binding: RegisterBinding()),
      ],
    );
  }
}
