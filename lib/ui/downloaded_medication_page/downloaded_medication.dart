import 'package:farmacoped/controllers/main_controller.dart';
import 'package:farmacoped/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DownloadedMedication extends GetView<MainController> {
  const DownloadedMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('downloaded'.tr),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(Get.width, 48.0),
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: controller.downloadedMedications.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.downloadedMedications.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                        Routes.MEDICATION,
                        arguments: controller.downloadedMedications[index],
                      ),
                      child: Container(
                        height: 64,
                        margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                          vertical: 8.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 186, 186, 186),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller
                                        .downloadedMedications[index].name,
                                    style: const TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller
                                        .downloadedMedications[index].type,
                                    style: const TextStyle(
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigo,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'downloaded_medication_empty'.tr,
                    style: const TextStyle(color: Colors.grey, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ),
    );
  }
}