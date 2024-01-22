import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/controllers/controller_dashboard/search_controller.dart';
import 'package:get/get.dart';

class SearchView extends GetView<searchController> {
  const SearchView({Key? key})
      : super(key: key); // Remove "const" from super(key: key)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.searchText.value = value;
                            controller.fetchData();
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: "   Search....",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color.fromARGB(255, 229, 228, 228),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 229, 229, 229),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "     Hasil Pencarian Restaurant",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.transparent,
                      height: 612,
                      width: double.infinity,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (controller.hasError.value) {
                          return Center(
                            child: Text('Error: ${controller.error.value}'),
                          );
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
                              return Container(
                                height: 90,
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
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
                              );
                            },
                          );
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
