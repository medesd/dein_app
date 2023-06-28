import 'package:dein_app/app/modules/setup_profile/views/step_five.dart';
import 'package:dein_app/app/modules/setup_profile/views/step_four.dart';
import 'package:dein_app/app/modules/setup_profile/views/step_one.dart';
import 'package:dein_app/app/modules/setup_profile/views/step_three.dart';
import 'package:dein_app/app/modules/setup_profile/views/step_two.dart';
import 'package:dein_app/app/widgets/d_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/setup_profile_controller.dart';

class SetupProfileView extends GetView<SetupProfileController> {
  const SetupProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.pageIndex.value == 0) {
          if (controller.backTimes.value) {
            return true;
          } else {
            Get.showSnackbar(
              const GetSnackBar(
                duration: Duration(seconds: 3),
                isDismissible: true,
                message: "Press again to exit",
              ),
            );
            controller.backTimes(true);
          }
        } else {
          controller.controller.animateToPage(controller.pageIndex.value - 1,
              duration: const Duration(milliseconds: 250), curve: Curves.ease);
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              if (controller.pageIndex.value == 0) {
                if (controller.backTimes.value) {
                  Get.back();
                } else {
                  Get.showSnackbar(
                    const GetSnackBar(
                      duration: Duration(seconds: 3),
                      isDismissible: true,
                      message: "Press again to exit",
                    ),
                  );
                  controller.backTimes(true);
                }
              } else {
                controller.controller.animateToPage(
                    controller.pageIndex.value - 1,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.ease);
              }
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF292c57),
            ),
          ),
          actions: [
            Obx(() => [1, 2].contains(controller.pageIndex.value)
                ? Container()
                : InkWell(
                    onTap: () {
                      if (controller.pageIndex.value == 4) return;
                      controller.controller.animateToPage(
                          controller.pageIndex.value + 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.ease);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: const Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Color(0xFF5666d8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
          ],
          title: Obx(() => Text(
                [1, 2].contains(controller.pageIndex.value)
                    ? 'Verify profile'
                    : "Your Profile",
                style: const TextStyle(
                  color: Color(0xFF292c57),
                  fontWeight: FontWeight.bold,
                ),
              )),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 70.h,
                    child: PageView(
                      controller: controller.controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        StepOne(),
                        StepTwo(),
                        StepThree(),
                        StepFour(),
                        StepFive(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  DButton(text: "Continue", onPress: controller.pressContinue),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
