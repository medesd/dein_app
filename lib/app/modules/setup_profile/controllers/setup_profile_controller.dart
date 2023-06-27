import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupProfileController extends GetxController {
  var pageIndex = 0.obs;
  final PageController controller = PageController(initialPage: 0);

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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pressContinue() {
    if (pageIndex.value == 4) return;
    controller.animateToPage(pageIndex.value + 1,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }
}
