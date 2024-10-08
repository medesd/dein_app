import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  var email = "example@example.com".obs;
  var password = "12345678".obs;

  void submitForm() {
    if (email.value == "example@example.com" && password.value == "12345678") {
      Get.offAllNamed(Routes.SETUP_PROFILE);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          animationDuration: Duration(seconds: 2),
          isDismissible: true,
          duration: Duration(seconds: 3),
          message: "Email or Password invalid",
        ),
      );
    }
  }
}
