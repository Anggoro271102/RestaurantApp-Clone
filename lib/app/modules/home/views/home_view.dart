import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/detail_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final DetailController _controller = Get.find<DetailController>();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              width: double.infinity,
              height: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.location_pin,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: const SizedBox(
                                width: 110,
                                child: Text("Yogyakarta",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                          Container(
                            width: 250,
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Guest",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.account_circle,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 380,
                      height: 170,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/restaurant-interior.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              hintText: "   Search...."),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 229, 229, 229)),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "     List Restaurant",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 400, // Sesuaikan tinggi dengan kontennya
                      width: 370,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.3,
                          ),
                          color: Colors.transparent),
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (controller.hasError.value) {
                          return Center(
                              child: Text('Error: ${controller.error.value}'));
                        } else if (controller.restaurantList.isEmpty) {
                          return const Center(
                              child: Text('No data available.'));
                        } else {
                          return ListView.builder(
                            itemCount: controller.restaurantList.length,
                            itemBuilder: (context, index) {
                              final restaurant =
                                  controller.restaurantList[index];
                              const imageUrl =
                                  "https://restaurant-api.dicoding.dev/images/small/";
                              return GestureDetector(
                                onTap: () {
                                  String IntentId = restaurant['id'];
                                  Navigator.pushNamed(context, '/detail',
                                      arguments: IntentId);
                                  _controller.idRestaurant.value = IntentId;
                                  _controller.fetchData();
                                },
                                child: Container(
                                  height: 90,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          width: 90,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl +
                                                  restaurant['pictureId']),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Text(
                                          restaurant['name'],
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          // return ListView.builder(
                          //   itemCount: controller.restaurantList.length,
                          //   itemBuilder: (context, index) {
                          //     final restaurant =
                          //         controller.restaurantList[index];
                          //     const imageUrl =
                          //         "https://restaurant-api.dicoding.dev/images/small/";
                          //     return Container(
                          //       height: 90,
                          //       margin: const EdgeInsets.all(5),
                          //       padding: const EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15),
                          //           color: Colors.grey),
                          //       child: Row(children: [
                          //         Padding(
                          //           padding: const EdgeInsets.only(right: 10),
                          //           child: Container(
                          //             width: 90,
                          //             height: 70,
                          //             decoration: BoxDecoration(
                          //               image: DecorationImage(
                          //                   image: NetworkImage(imageUrl +
                          //                       restaurant['pictureId']),
                          //                   fit: BoxFit.cover),
                          //               borderRadius: BorderRadius.circular(15),
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //         Container(
                          //           color: Colors.transparent,
                          //           child: Text(
                          //             restaurant['name'],
                          //             style: const TextStyle(fontSize: 20),
                          //           ),
                          //         ),
                          //       ]),
                          //     );
                          //   },
                          // );
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
