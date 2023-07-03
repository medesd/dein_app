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
      backgroundColor: const Color(0xfff1f6fd),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => InkWell(
                      onTap: () {
                        controller.businessAccount(false);
                      },
                      child: Container(
                        height: 24.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: !controller.businessAccount.value
                                ? const Color(0xFF5666d8)
                                : const Color(0xFFc8c9d4),
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 7.w, top: 3.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AssetsRes.USER,
                                fit: BoxFit.fitWidth,
                                width: 10.w,
                                height: 10.w,
                                color: !controller.businessAccount.value
                                    ? const Color(0xFF5666d8)
                                    : const Color(0xFFc8c9d4),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Private",
                                style: TextStyle(
                                    color: !controller.businessAccount.value
                                        ? const Color(0xFF5666d8)
                                        : const Color(0xFF646681),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              const Text("Choose this if you are looking for\nservices or are unemployed.",style: TextStyle(color: Color(0xFF646681)),)
                            ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 2.h,),
                Obx(() => InkWell(
                      onTap: () {
                        controller.businessAccount(true);
                      },
                      child: Container(
                        height: 24.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.businessAccount.value
                                ? const Color(0xFF5666d8)
                                : const Color(0xFFc8c9d4),
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Padding(
                          padding:EdgeInsets.only(left: 7.w, top: 3.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AssetsRes.FACTORY,
                                fit: BoxFit.fitWidth,
                                width: 10.w,
                                height: 10.w,
                                color: controller.businessAccount.value
                                    ? const Color(0xFF5666d8)
                                    : const Color(0xFFc8c9d4),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Business",
                                style: TextStyle(
                                    color: controller.businessAccount.value
                                        ? const Color(0xFF5666d8)
                                        : const Color(0xFF646681),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              const Text("Choose this if you are providing\nservices or looking for employees.",style: TextStyle(color: Color(0xFF646681)),)
                            ],
                          ),
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
              onPress: () => Get.offAllNamed(Routes.PRE_AUTH),
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
