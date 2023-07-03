import 'package:dein_app/app/modules/home/controllers/home_controller.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/d_button.dart';
import '../../../../widgets/d_textfield.dart';


class SearchContainer extends GetView<HomeController> {
  const SearchContainer({super.key});

  Widget popularEntry(String text) {
    return GestureDetector(
      onTap: () {
        controller.searchMode(1);
        controller.keyword(text);
      },
      child: Container(
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: const Color(0xffc8c9d4),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 13.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Text(
          "What are you looking for?",
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff292c57)),
        ),
        SizedBox(
          height: 4.h,
        ),
        Obx(()=>DTextField(
          defaultValue: controller.keyword.value,
          withShadow: false,
          placeHolder: "eg. doctor, financing consultant...",
          onChanged: (val)=>controller.keyword(val.toLowerCase()
              .replaceAll(" ", "_")),
        ),),
        SizedBox(
          height: 4.h,
        ),
        Wrap(
          spacing: 3.w,
          runSpacing: 1.h,
          children: [
            "Job",
            "Doctor",
            "Lawyer",
            "Financial planner",
            "Tax advisor",
            "Management consultant"
          ].map((e) => popularEntry(e)).toList(),
        ),
        SizedBox(
          height: 5.h,
        ),
        DButton(
          text: "Search",
          onPress: () {
            controller.searchMode(1);
          },
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }
}
