import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/account_controller.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  final AccountController imageController = Get.find<AccountController>();
  AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 60, right: 60),
              child: Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                ),
                child: const Text(
                  "My Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Guest',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
                            child: Container(
                              color: Colors.transparent,
                              height: 40,
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await imageController
                                              .getImageFromGallery();
                                        },
                                        child: const Text("Upload Gallery"),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.transparent,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await imageController
                                              .getImageFromCamera();
                                        },
                                        child: const Text("Upload Camera"),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Obx(() {
                      final image = imageController.image.value;
                      return image != null
                          ? Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(image),
                                ),
                              ),
                            )
                          : Container(
                              width: 150,
                              height: 150,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 230),
                    child: Container(
                      width: 150,
                      color: Colors.transparent,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set your desired border radius
                          ),
                        ),
                        onPressed: () async {
                          // imageController.logout();
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              color: Color.fromARGB(178, 8, 144, 255),
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
