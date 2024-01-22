import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/detail_controller.dart';
import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://restaurant-api.dicoding.dev/images/small/";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
        backgroundColor: Colors.blue,
        elevation: 4.0,
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.hasError.value) {
            print("id ${controller.idRestaurant.value}");
            return Center(child: Text('Error: ${controller.error.value}'));
          } else {
            return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl +
                                controller.restaurantPictureId.value),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 440,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 212, 212, 212)),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent),
                            child: Text(
                              "   Rating\t: ${controller.restaurantRating.value}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "  ${controller.restaurantName.value}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, right: 11),
                          child: Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            child: Text(
                              controller.restaurantDescription.value,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
