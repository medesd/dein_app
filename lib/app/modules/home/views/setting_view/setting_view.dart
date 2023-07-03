import 'dart:io';

import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/routes/app_pages.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                          backgroundColor: const Color(0xffe6e6e6),
                          radius: 26.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.sp),
                            child: DataController.avatar.isEmpty
                                ? Image.asset(AssetsRes.AVATAR)
                                : Image.file(
                                    File(DataController.avatar.value),
                                    width: 40.w,
                                    height: 40.w,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Image.asset(
                          AssetsRes.SUCCESS,
                          scale: 1.sp,
                          color: const Color(0xff5666d8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Obx(
                  () => Text(
                    DataController.name.value,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            width: 100.w,
            color: const Color(0xfff1f6fd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Edit profile"),
                        minLeadingWidth: 0,
                        onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                        leading: Image.asset(
                          AssetsRes.EDIT,
                          scale: 2.5.sp,
                          color: const Color(0xff5666d8),
                        ),
                      ),
                      Divider(endIndent: 5.w, indent: 5.w, height: 0),
                      ListTile(
                        title: const Text("App settings"),
                        minLeadingWidth: 0,
                        leading: Image.asset(
                          AssetsRes.APP_SETTINGS,
                          scale: 3.sp,
                          color: const Color(0xff5666d8),
                        ),
                      ),
                      Divider(endIndent: 5.w, indent: 5.w, height: 0),
                      ListTile(
                        title: const Text("Notifications"),
                        minLeadingWidth: 0,
                        leading: Image.asset(
                          AssetsRes.NOTIFICATION,
                          scale: 3.sp,
                          color: const Color(0xff5666d8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Send feedback",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Image.asset(
                      AssetsRes.TO,
                      scale: 3.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "About us",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Rate app",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                    onTap: () {
                      DataController.clearValues();
                      Get.offAllNamed(Routes.CHOOSE_USER);
                    },
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          fontSize: 12.sp, color: const Color(0xff5666d8)),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "v1.02",
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xff9c9dac)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
