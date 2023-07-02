import 'package:camerapreview/camerapreview.dart';
import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/video_call_controller.dart';

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
                      Container(
                        height: 20.h,
                        width: 23.75.w,
                        decoration: BoxDecoration(
                         /* image: const DecorationImage(
                            image: AssetImage(AssetsRes.AVATAR),
                          ),*/
                          borderRadius: BorderRadius.circular(15.sp),
                          color: const Color(0xffe6e6e6),
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(15.sp),child: CameraPreviewImage(cameraOption: CameraOption.Front,onCapture: (file)=>{})),
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
