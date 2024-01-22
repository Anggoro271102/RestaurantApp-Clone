import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/dashboard_controller.dart';
import 'package:flutter_application_1/app/modules/home/views/account_view.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/modules/home/views/search_view.dart';
import 'package:flutter_application_1/app/modules/home/views/webview_view.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetView<DashBoardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              const SearchView(),
              AccountView(),
              const WebViewPage()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.home, label: "Home"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.search, label: "Search"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.person, label: "Account"),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.globe, label: "Web View"),
            ]),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
