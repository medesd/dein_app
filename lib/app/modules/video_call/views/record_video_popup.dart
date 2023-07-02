import 'package:dein_app/app/widgets/d_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/video_call_controller.dart';

class RecordVideoPopup extends GetView<VideoCallController> {
  const RecordVideoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Align(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              width: 80.w,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, top: 2.h, right: 5.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Video recording request",
                        style: TextStyle(
                          color: const Color(0xFF292c57),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Text(
                        "Julien H. would like to record this\nvideo chat. Do you consent?",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DButton(
                        text: "Yes, I consent",
                        onPress: () {
                          controller.startRecord(
                              fileName: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString());
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DButton(
                        text: "No, I decline",
                        color: Colors.white,
                        textColor: const Color(0xff5666d8),
                        onPress: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
