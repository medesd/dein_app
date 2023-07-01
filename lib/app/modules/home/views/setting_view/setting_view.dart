import 'dart:io';

import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:5.w,vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.more_vert),
                ),
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
                        child: dataController.avatar.isNotEmpty
                            ? Image.file(File(dataController.avatar.value))
                            : Image.asset(AssetsRes.AVATAR),
                      ),
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
                    dataController.name.value,
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
            padding: EdgeInsets.symmetric(horizontal:8.w,vertical: 5.h),
            width: 100.w,
            color: const Color(0xfff1f6fd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.sp)),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text("Edit profile"),
                        minLeadingWidth: 0,
                        leading: Icon(Icons.pan_tool_alt),
                      ),
                      Divider(endIndent: 5.w,indent: 5.w,height: 0),
                      const ListTile(
                        title: Text("App settings"),
                        minLeadingWidth: 0,
                        leading: Icon(Icons.settings),
                      ),
                      Divider(endIndent: 5.w,indent: 5.w,height: 0),
                      const ListTile(
                        title: Text("Notifications"),
                        minLeadingWidth: 0,
                        leading: Icon(Icons.notification_important),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                Text("Send feedback",style: TextStyle(fontSize: 12.sp),),
                SizedBox(height: 2.h,),
                Text("About us",style: TextStyle(fontSize: 12.sp),),
                SizedBox(height: 2.h,),
                Text("Rate app",style: TextStyle(fontSize: 12.sp),),
                SizedBox(height: 3.h,),
                Text("Sign out",style: TextStyle(fontSize: 12.sp,color: const Color(0xff5666d8)),),
                SizedBox(height: 2.h,),
                Text("v1.02",style: TextStyle(fontSize: 12.sp,color: const Color(0xff9c9dac)),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
