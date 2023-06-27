import 'package:dein_app/app/widgets/d_button.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tell us about yourself",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
              fontSize: 13.sp),
        ),
        SizedBox(height: 4.h),
        const DTextField(
          area: true,
          placeHolder: "About me",
        ),
      ],
    );
  }
}
