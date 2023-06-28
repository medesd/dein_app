import 'dart:io';

import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/app/modules/setup_profile/controllers/setup_profile_controller.dart';
import 'package:dein_app/app/widgets/d_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../res/assets_res.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    var setupController = Get.put(SetupProfileController());
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              "Provide government-issued",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "document photo",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(
              AssetsRes.INFO,
              scale: 4.5.sp,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Obx(
          () => Container(
            height: 20.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: const Color(0xffecebeb),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: dataController.document.isEmpty
                ? GestureDetector(
                  onTap: () async => setupController.pickDocument(),
                  child: Align(
                      child: Image.asset(
                        AssetsRes.CAMERA,
                        scale: 4.sp,
                      ),
                    ),
                )
                : Image.file(File(dataController.document.value),
                    fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              "Take a selfie",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(
              AssetsRes.INFO,
              scale: 4.5.sp,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Obx(
          () => Container(
            height: 20.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: const Color(0xffecebeb),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: dataController.avatar.isEmpty
                ? GestureDetector(
                  onTap: () async =>setupController.pickSelfie(),
                  child: Align(
                      child: Image.asset(
                        AssetsRes.CAMERA,
                        scale: 4.sp,
                      ),
                    ),
                )
                : Image.file(File(dataController.avatar.value),fit: BoxFit.contain,),
          ),
        ),
      ],
    );
  }
}
