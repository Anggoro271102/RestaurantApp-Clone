import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/wishlist_controller.dart';
import 'package:get/get.dart';

class WishListView extends GetView<WishListController> {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'WishListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
