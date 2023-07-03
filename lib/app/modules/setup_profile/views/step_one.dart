import 'dart:io';

import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/setup_profile/controllers/setup_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../res/assets_res.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
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
          () => GestureDetector(
            onTap: () async => setupController.pickDocument(),
            child: Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xffecebeb),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: DataController.document.isEmpty
                  ? Align(
                      child: Image.asset(
                        AssetsRes.CAMERA,
                        scale: 4.sp,
                      ),
                    )
                  : Image.file(File(DataController.document.value),
                      fit: BoxFit.contain),
            ),
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
          () => GestureDetector(
            onTap: () async =>setupController.pickSelfie(),
            child: Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xffecebeb),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: DataController.avatar.isEmpty
                  ? Align(
                      child: Image.asset(
                        AssetsRes.CAMERA,
                        scale: 4.sp,
                      ),
                    )
                  : Image.file(File(DataController.avatar.value),fit: BoxFit.contain,),
            ),
          ),
        ),
      ],
    );
  }
}
