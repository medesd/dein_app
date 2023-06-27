import 'package:dein_app/app/widgets/d_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../res/assets_res.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              "Provide government-issued",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "document photo",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(
              AssetsRes.INFO,
              scale: 4.5.sp,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 21.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: const Color(0xffecebeb),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Align(
            child: Image.asset(
              AssetsRes.CAMERA,
              scale: 4.sp,
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              "Take a selfie",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF292c57),
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(
              AssetsRes.INFO,
              scale: 4.5.sp,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          height: 21.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: const Color(0xffecebeb),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Align(
            child: Image.asset(
              AssetsRes.CAMERA,
              scale: 4.sp,
            ),
          ),
        ),
      ],
    );
  }
}
