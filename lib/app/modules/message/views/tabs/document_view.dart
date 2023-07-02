import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/message/controllers/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DocumentView extends GetView<MessageController> {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Obx(() => Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                if (DataController.userDocument.isEmpty)
                  SizedBox(
                    height: 40.h,
                    child: const Center(
                      child: Text("Empty"),
                    ),
                  ),
                ...DataController.userDocument
                    .where((p0) => p0.user == controller.user.id)
                    .map(
                      (e) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: const Color(0xff5666d8),
                        ),
                        child: Text(
                          e.document!.split("/").last,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList()
              ],
            )),
      ),
    );
  }
}
