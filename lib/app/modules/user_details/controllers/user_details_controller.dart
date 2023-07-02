import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/data/user_parser.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  var user = UserParser().obs;

  @override
  void onInit() {
    super.onInit();
    user.value = DataController.users
        .where((element) => element.id == Get.arguments)
        .first;
  }
}
