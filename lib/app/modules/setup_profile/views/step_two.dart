import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          child: Image.asset(
            AssetsRes.THANK_YOU,
            scale: 4.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Align(
          child: Text(
            "Thank you!",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Align(
          child: Text(
            "We will review your document within few\nminutes. We will send you notification as\nsoon as this is done.",
            textAlign: TextAlign.center,
            style: TextStyle(color: const Color(0xFF646681), fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
