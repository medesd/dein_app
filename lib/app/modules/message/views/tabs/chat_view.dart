import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/data_controller.dart';
import '../../controllers/message_controller.dart';

class ChatView extends GetView<MessageController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      color: const Color(0xfff1f6fd),
      child: SingleChildScrollView(
        controller: controller.messageController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Obx(() => Column(
              children: controller.messageEdited.value
                  ? [
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    ]
                  : DataController.messages
                      .where((element) => element.user == controller.user.id)
                      .map((e) => Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              ...(e.data!
                                    ..sort(
                                        (a, b) => a.date!.compareTo(b.date!)))
                                  .asMap()
                                  .map(
                                    (key, val) => MapEntry(
                                      key,
                                      Column(
                                        children: [
                                          if(key==0)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            child: Text(
                                              DateFormat("MMM dd").format(
                                                  DateTime.parse(e.date!)),
                                              style: const TextStyle(
                                                  color: Color(0xff9c9dac)),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: val.user! == 0
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: val.user! !=
                                                        0
                                                    ? CrossAxisAlignment.start
                                                    : CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 2.h),
                                                    decoration: BoxDecoration(
                                                      color: val.user! == 0
                                                          ? const Color(
                                                              0xff5666d8)
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    child: Text(
                                                      val.message!,
                                                      style: TextStyle(
                                                          color: val.user! == 0
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    DateFormat("hh:mm").format(
                                                      DateTime.parse(e.date!),
                                                    ),
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff9c9dac)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList()
                            ],
                          ))
                      .toList(),
            )),
      ),
    );
  }
}
