import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/message/controllers/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/schedule_parser.dart';

class ScheduleView extends GetView<MessageController> {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              if (DataController.userSchedule.isEmpty)
                SizedBox(
                  height: 40.h,
                  child: const Center(
                    child: Text("Empty"),
                  ),
                ),
              ...DataController.userSchedule
                  .where((p0) => p0.user == controller.user.id)
                  .map(
                    (e) => Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          width: 70.w,
                          decoration: BoxDecoration(
                              color: const Color(0xff5666d8),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Column(
                            children: [
                              Text(
                                  "You have scheduled a${e.type == ScheduleType.Call ? " Video call" : "n Appointment"}",
                                  style: const TextStyle(color: Colors.white)),
                              SizedBox(
                                height: 1.h,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    DateFormat("dd.MM.yyyy hh:mm")
                                        .format(e.date!),
                                    style: const TextStyle(
                                        color: Color(0xffeaeaea)),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
