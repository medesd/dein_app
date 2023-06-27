import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  const DButton({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(15.sp),
      child: Container(
        width: 100.w,
        height: 9.h,
        decoration: BoxDecoration(
            color: const Color(0xFF5666d8),
            borderRadius: BorderRadius.circular(12.sp)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
