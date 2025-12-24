import 'package:get/get.dart';
import 'package:idea_assignment/app/routes/app_pages.dart';

class SplashController extends GetxController {
  RxDouble middleOpacity = 1.0.obs;
  RxDouble topPosition = 0.0.obs;
  late double screenHeight;

  @override
  void onInit() {
    super.onInit();
    screenHeight = Get.height; // dynamic screen height
    startAnimation();
  }

  void startAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    middleOpacity.value = 0.0;
    await Future.delayed(const Duration(milliseconds: 500));
    topPosition.value = screenHeight * 0.50;
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(Routes.HOME);
  }
}
