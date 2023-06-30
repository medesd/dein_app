import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Verify mobile number",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
              fontSize: 16.sp),
        ),
        SizedBox(height: 1.h,),
        Text(
          "We will send you an SMS with PIN to\nverify.",
          style: TextStyle(color: const Color(0xff646681), fontSize: 10.sp),
        ),
        SizedBox(height: 1.h,),
        DTextField(
          placeHolder: "Phone number",
          withShadow: false,
          withBorder: true,
          suffix: Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h, right: 1.h),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff5666d8),
                borderRadius: BorderRadius.circular(6.sp),
              ),
              child: const Center(
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        const Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF292c57),
                  fontSize: 13.sp),
            ),
            const Row(
              children: [
                Text("Didn't receive it? "),
                Text(
                  "Send again",
                  style: TextStyle(color: Color(0xff5666d8)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 2.h,),
        const DTextField(
          placeHolder: "PIN",
          withShadow: false,
          withBorder: true,
          hidden: true,
        ),
      ],
    );
  }
}
