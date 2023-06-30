import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfileController extends GetxController {
  var pageIndex = 0.obs;
  final PageController controller = PageController(initialPage: 0);
  final ImagePicker picker = ImagePicker();
  var dataController = Get.put(DataController());

  var appBarText = [
    "Your profile",
    "Verify profile",
  ];

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      pageIndex(controller.page?.toInt());
    });
  }

  void pressContinue() {
    if (pageIndex.value == 6) {
      Get.offAllNamed(Routes.HOME);
    }

    if (dataController.avatar.isEmpty &&
        dataController.document.isEmpty &&
        pageIndex.value == 0) {
      Get.showSnackbar(const GetSnackBar(
        animationDuration: Duration(seconds: 2),
        isDismissible: true,
        message: "make sure to upload a selfie and document",
        duration: Duration(seconds: 3),
      ));
      return;
    }
    controller.animateToPage(pageIndex.value + 1,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  Future<void> pickDocument() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      dataController.document(photo.path);
    }
  }

  Future<void> pickSelfie() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      dataController.avatar(photo.path);
    }
  }

  void addSkill(String skill) {
    if (dataController.skills.contains(skill)) return;
    dataController.skills.add(skill);
    dataController.skills.refresh();
  }

  void removeSkill(int index) {
    dataController.skills.removeAt(index);
    dataController.skills.refresh();
  }
}
