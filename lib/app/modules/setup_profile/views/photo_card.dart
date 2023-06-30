import 'dart:io';

import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PhotoCard extends StatelessWidget {
  final RxString image;

  const PhotoCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 15.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: const Color(0xffe7e8e8),
            borderRadius: BorderRadius.circular(10.sp),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(image.value)),
            ),
          ),
        ),
        Positioned(
          right: 1.w,
          top: 1.w,
          child: CircleAvatar(
            radius: 10.sp,
            backgroundColor: const Color(0xff646681),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
