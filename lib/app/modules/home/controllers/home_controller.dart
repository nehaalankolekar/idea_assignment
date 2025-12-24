import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class HomeController extends GetxController {
  final health = Health();

  var steps = 0.obs;
  var calories = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    //fetchHealthData();
  }

  Future<void> fetchHealthData() async {
    ///configure plugin first
    await health.configure();

    final types = [HealthDataType.STEPS, HealthDataType.ACTIVE_ENERGY_BURNED];

    ///request authorization
    final authorized = await health.requestAuthorization(types);
    if (!authorized) {
      Get.snackbar(
        "Permission Required",
        "Please allow health permissions to track steps and calories.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.white,
        colorText: Get.isDarkMode ? Colors.white : Colors.black,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    ///fetch health data
    final data = await health.getHealthDataFromTypes(
      startTime: midnight,
      endTime: now,
      types: types,
    );

    ///sum steps
    steps.value = data
        .where((e) => e.type == HealthDataType.STEPS)
        .fold(0, (sum, e) => sum + (e.value as int));

    ///sum calories
    calories.value = data
        .where((e) => e.type == HealthDataType.ACTIVE_ENERGY_BURNED)
        .fold(0.0, (sum, e) => sum + (e.value as double));
  }
}
