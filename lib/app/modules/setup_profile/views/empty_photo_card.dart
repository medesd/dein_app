import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyPhotoCard extends StatelessWidget {
  const EmptyPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 20.w,
      decoration: BoxDecoration(
        color: const Color(0xffe7e8e8),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Center(child: Image.asset(AssetsRes.PLUS,scale: 2.sp,),),
    );
  }
}
