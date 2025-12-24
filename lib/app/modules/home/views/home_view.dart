import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idea_assignment/app/routes/app_image.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: Obx(() {
          //if (controller.steps.value == 0 && controller.calories.value == 0) {
          //   return Center(
          //     child: Text(
          //       "No data available.\nPlease ensure Health Connect is installed and permissions are granted.",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontSize: 18),
          //     ),
          //   );
          // }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Greeting
                const Text(
                  "Hi!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                /// Steps Card
                _FitnessCard(
                  title: "Steps",
                  value: controller.steps.value.toString(),
                  progress: 13112 / 15000,
                  goal: "15,000",
                ),

                const SizedBox(height: 16),

                /// Calories Card
                _FitnessCard(
                  title: "Calories Burned",
                  value: controller.calories.value.toString(),
                  progress: 500 / 1000,
                  goal: "1000",
                  iconLabel: "KCAL",
                ),
              ],
            ),
          );
          //  }
        }),
      ),
    );
  }
}

class _FitnessCard extends StatelessWidget {
  final String title;
  final String value;
  final double progress;
  final String goal;
  final String? iconLabel;

  const _FitnessCard({
    required this.title,
    required this.value,
    required this.progress,
    required this.goal,
    this.iconLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Color(0xFF323232) : Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /// Left Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title:  $value",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                /// Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    borderRadius: BorderRadius.circular(30),
                    minHeight: 10,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                /// Goal Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 12,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "Goal: $goal",
                      style: TextStyle(
                        fontSize: 12,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          SvgPicture.asset(
            title.contains("Steps") ? AppImages.foot : AppImages.kcal,
            colorFilter: ColorFilter.mode(
              Get.isDarkMode ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
