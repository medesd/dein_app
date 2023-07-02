import 'package:dein_app/app/routes/app_pages.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MessageOptions extends StatelessWidget {
  const MessageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 87.5.h,
            color: Colors.black.withOpacity(.4),
          ),
        ),
        Positioned(
          bottom: 8.h,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.sp),
                  topLeft: Radius.circular(15.sp),
                ),
              ),
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, top: 2.h, right: 2.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Content and tools",
                              style: TextStyle(
                                color: const Color(0xFF292c57),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.close,
                                size: 25.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 89.w,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f6fd),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            AssetsRes.CALENDAR,
                            scale: 3.sp,
                          ),
                          minLeadingWidth: 2.w,
                          title: Text("Schedule appointment"),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 89.w,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f6fd),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            AssetsRes.VIDEO,
                            scale: 3.sp,
                          ),
                          minLeadingWidth: 2.w,
                          onTap: () {
                            Get.toNamed(Routes.VIDEO_CALL);
                          },
                          title: Text("Schedule video call"),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 89.w,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f6fd),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            AssetsRes.PEN,
                            scale: 3.sp,
                          ),
                          minLeadingWidth: 7.w,
                          title: Text("Request a contract"),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
