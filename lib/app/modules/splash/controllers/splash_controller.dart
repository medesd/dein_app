import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController


  @override
  void onInit() {
    super.onInit();
   Future.delayed(const Duration(seconds: 3))
        .then((value) {
          Get.offAllNamed(Routes.CHOOSE_USER);
        });
  }

}
