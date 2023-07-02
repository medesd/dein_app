import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/video_call_controller.dart';
import 'camera_preview.dart';

class VideoCallView extends GetView<VideoCallController> {
  const VideoCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    var user = dataController.users.first;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                color: const Color(0xffd3d3d3),
                child: Image.asset(user.images!.first,
                    fit: BoxFit.cover, height: 100.h)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: const Color(0xff6c6c6c),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5.sp,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            const Text(
                              "Record video",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: 22.5.h,
                            child: Column(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 23.75.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    color: const Color(0xffe6e6e6),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    child: Obx(
                                      () => !controller.toggleVideo.value
                                          ? CallCameraPreview(
                                              cameraOption: CameraOption.Front,
                                              onCapture: (file) => {},
                                            )
                                          : Center(
                                              child: Image.asset(
                                                AssetsRes.AVATAR,
                                                scale: 2.5.sp,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xff5666d8),
                            radius: 14.sp,
                            child: Image.asset(
                              AssetsRes.REFRESH,
                              scale: 3.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.name!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: const [
                                Shadow(color: Colors.black, blurRadius: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleVideo.toggle();
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff9e9193),
                              radius: 25.sp,
                              child: Obx(() => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AssetsRes.CALL_VIDEO,
                                        scale: 3.sp,
                                      ),
                                      if (controller.toggleVideo.value)
                                        const RotationTransition(
                                          turns:
                                              AlwaysStoppedAnimation(-40 / 360),
                                          child: Divider(
                                            thickness: 4,
                                            color: Colors.white,
                                            endIndent: 6,
                                            indent: 6,
                                          ),
                                        ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffe85d76),
                              radius: 25.sp,
                              child: Image.asset(
                                AssetsRes.CALL_PHONE,
                                scale: 3.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.toggleMic.toggle();
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff9e9193),
                              radius: 25.sp,
                              child: Obx(() => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AssetsRes.CALL_MIC,
                                        scale: 3.sp,
                                      ),
                                      if (controller.toggleMic.value)
                                        const RotationTransition(
                                          turns:
                                              AlwaysStoppedAnimation(-40 / 360),
                                          child: Divider(
                                            thickness: 4,
                                            color: Colors.white,
                                            endIndent: 6,
                                            indent: 6,
                                          ),
                                        ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Swipe up to show the chat",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 1),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
