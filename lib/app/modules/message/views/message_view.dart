import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/message/views/message_options.dart';
import 'package:dein_app/app/modules/message/views/tabs/chat_view.dart';
import 'package:dein_app/app/modules/message/views/tabs/document_view.dart';
import 'package:dein_app/app/modules/message/views/tabs/schedule_view.dart';
import 'package:dein_app/app/routes/app_pages.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                          color: const Color(0xff292c57),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Column(
                          children: [
                            Container(
                              height: 18.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffb8c0c6),
                                borderRadius: BorderRadius.circular(10.sp),
                                image: DecorationImage(
                                  image:
                                      AssetImage(controller.user.images!.first),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.user.name!,
                                  style: TextStyle(
                                      color: const Color(0xff292c57),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.USER_DETAILS,
                                        arguments: controller.user.id);
                                  },
                                  child: CircleAvatar(
                                    radius: 8.sp,
                                    backgroundColor: const Color(0xff5666d8),
                                    child: const Text("i"),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "${controller.user.location!} • ${controller.user.age!} years",
                              style: const TextStyle(
                                color: Color(0xff646681),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            const MessageOptions(),
                            useSafeArea: true,
                            barrierColor: Colors.transparent,
                            arguments: controller.user.id
                          );
                        },
                        child: Icon(
                          Icons.more_vert,
                          size: 20.sp,
                          color: const Color(0xff292c57),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TabBar(
                  onTap: (val) {
                    controller.tabIndex(val);
                  },
                  controller: controller.tabController,
                  indicatorColor: const Color(0xff5666d8),
                  indicatorWeight: 4,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Chat",
                        style: TextStyle(
                          color: Color(0xff9c9dac),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Schedules",
                        style: TextStyle(
                          color: Color(0xff9c9dac),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Documents",
                        style: TextStyle(
                          color: Color(0xff9c9dac),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 52.h,
                child: PageView(
                  controller: controller.pageController,
                  children: const [
                    ChatView(),
                    ScheduleView(),
                    DocumentView(),
                  ],
                ),
              ),
              Container(
                height: 9.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          blurRadius: 20,
                          offset: const Offset(0, -10))
                    ]),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xff5666d8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                      ),
                      Expanded(
                        child: DTextField(
                          withShadow: false,
                          placeHolder: "Your message",
                          onSubmit: (val) {
                            controller.sendMessage(val);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.pickDocument(),
                        child: Image.asset(
                          AssetsRes.ATTACH,
                          scale: 3.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
