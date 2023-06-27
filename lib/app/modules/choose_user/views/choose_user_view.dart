import 'package:dein_app/app/widgets/d_button.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/choose_user_controller.dart';

class ChooseUserView extends GetView<ChooseUserController> {
  const ChooseUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Choose user type',
          style:
              TextStyle(color: Color(0xFF292c57), fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => InkWell(
                      onTap: () {
                        controller.businessAccount(false);
                      },
                      child: Container(
                        height: 24.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: !controller.businessAccount.value
                                ? const Color(0xFF5666d8)
                                : const Color(0xFFc8c9d4),
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsRes.USER,
                              fit: BoxFit.fitWidth,
                              width: 15.w,
                              height: 10.h,
                              color: !controller.businessAccount.value
                                  ? const Color(0xFF5666d8)
                                  : const Color(0xFFc8c9d4),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Normal",
                              style: TextStyle(
                                  color: !controller.businessAccount.value
                                      ? const Color(0xFF5666d8)
                                      : const Color(0xFF646681),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
                Obx(() => InkWell(
                      onTap: () {
                        controller.businessAccount(true);
                      },
                      child: Container(
                        height: 24.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.businessAccount.value
                                ? const Color(0xFF5666d8)
                                : const Color(0xFFc8c9d4),
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsRes.FACTORY,
                              width: 15.w,
                              fit: BoxFit.fitWidth,
                              height: 10.h,
                              color:controller.businessAccount.value
                                  ? const Color(0xFF5666d8)
                                  : const Color(0xFFc8c9d4),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Business",
                              style: TextStyle(
                                  color: controller.businessAccount.value
                                      ? const Color(0xFF5666d8)
                                      : const Color(0xFF646681),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            DButton(
              text: "Continue",
              onPress: () => Get.offAllNamed(Routes.AUTH),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
