import 'package:chat_bubbles/chat_bubbles.dart';
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
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          color: const Color(0xfff1f6fd),
          child: SingleChildScrollView(
            controller: controller.messageController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: DataController.messages
                  .where((element) =>
                      element.user == controller.user.id)
                  .map((e) => Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              DateFormat("MMM dd")
                                  .format(DateTime.parse(e.date!)),
                              style: const TextStyle(color: Color(0xff9c9dac)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ...(e.data!
                                ..sort(
                                    (a, b) => a.date!.compareTo(b.date!)))
                              .map((e) => Row(
                                    mainAxisAlignment: e.user! == 0
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: e.user! != 0
                                            ? CrossAxisAlignment.start
                                            : CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 2.h),
                                            decoration: BoxDecoration(
                                              color: e.user! == 0
                                                  ? const Color(0xff5666d8)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                            ),
                                            child: Text(
                                              e.message!,
                                              style: TextStyle(
                                                  color: e.user! == 0
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
                                                color: Color(0xff9c9dac)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                              .toList()
                        ],
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
