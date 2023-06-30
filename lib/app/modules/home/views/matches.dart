import 'package:dein_app/app/data_controller.dart';
import 'package:dein_app/app/modules/home/controllers/home_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';

class Matches extends GetView<HomeController> {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    var dataController = Get.put(DataController());
    var selectedUser = dataController.users
        .where((element) => element.id == controller.touchedUser.value)
        .first;
    return Container(
      color: const Color(0xfff1f6fd),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.touchedUser(0);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      AssetsRes.BACK,
                      scale: 3.sp,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    AssetsRes.TOOLS,
                    scale: 3.sp,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Container(
              height: 73.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage(selectedUser.images!.first),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          selectedUser.name!,
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.USER_DETAILS,
                                arguments: selectedUser.id!);
                          },
                          child: CircleAvatar(
                            radius: 9.sp,
                            backgroundColor: Colors.white,
                            child: Text(
                              "i",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Text(
                          selectedUser.location!,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        Text(
                          " • ",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        Text(
                          "${selectedUser.age} years",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsRes.CLOSE_CIRCLE,
                          scale: 3.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Image.asset(
                          AssetsRes.HEART_CIRCLE,
                          scale: 3.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
