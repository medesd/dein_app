import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/setup_profile/views/photo_card.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'empty_photo_card.dart';

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photos",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
              fontSize: 13.sp),
        ),
        SizedBox(height: 3.h,),
        Obx(()=>Row(children: [
          PhotoCard(image:DataController.avatar.value),
          SizedBox(width: 1.w,),
          const EmptyPhotoCard(),
          SizedBox(width: 1.w,),
          const EmptyPhotoCard(),
        ],)),

        SizedBox(height: 3.h,),
        Text(
          "Tell us about yourself",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
              fontSize: 13.sp),
        ),
        SizedBox(height: 4.h),
        DTextField(
          area: true,
          withBorder: true,
          placeHolder: "About me",
          onChanged: (val)=>DataController.userAbout(val),
        ),
        SizedBox(height: 3.h,),
        Text(
          "Location",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF292c57),
              fontSize: 13.sp),
        ),
        SizedBox(height: 3.h),
        DTextField(
          withShadow: false,
          withBorder: true,
          placeHolder: "Location",
          onChanged: (val)=> DataController.userLocation(val),
        ),
      ],
    );
  }
}
