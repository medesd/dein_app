import 'package:get/get.dart';

import '../controllers/pre_auth_controller.dart';

class PreAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreAuthController>(
      () => PreAuthController(),
    );
  }
}
