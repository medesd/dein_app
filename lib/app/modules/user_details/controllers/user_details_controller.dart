import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/app/user_parser.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  var user = UserParser().obs;
  var dataController = Get.put(DataController());

  @override
  void onInit() {
    super.onInit();
    user.value = dataController.users
        .where((element) => element.id == Get.arguments)
        .first;
  }
}
