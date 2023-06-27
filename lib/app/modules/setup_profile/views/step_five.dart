import 'package:dein_app/app/widgets/d_button.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          leading: Image.asset(
            AssetsRes.PEN,
            scale: 5,
          ),
          minLeadingWidth: 5.w,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: const Text(
            "Education",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Text(
            "Edit",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF5666d8)),
          ),
        ),
        ListTile(
          leading: Image.asset(
            AssetsRes.SUITCASE,
            scale: 5,
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 5.w,
          title: const Text(
            "Experience",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Text(
            "Edit",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF5666d8)),
          ),
        ),
        SizedBox(
          width: 90.w,
          child: const Divider(
            thickness: 1.5,
          ),
        ),
        SizedBox(height: 3.h,),
        Text(
          "Documents",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF292c57),
          ),
        ),
        SizedBox(height: 4.h,),
        ListTile(
          leading: Image.asset(
            AssetsRes.PLUS,
            scale: 5,
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 5.w,
          title: const Text(
            "Add documents",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
