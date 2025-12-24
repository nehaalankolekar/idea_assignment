import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idea_assignment/app/routes/app_image.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Stack(
            children: [
              Center(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: controller.middleOpacity.value,
                  child: SvgPicture.asset(AppImages.logoI),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                top: controller.topPosition.value,
                left: MediaQuery.of(context).size.width / 2.2,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.logo,
                      colorFilter: ColorFilter.mode(
                        Get.isDarkMode ? Colors.white : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      "Fitness",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
