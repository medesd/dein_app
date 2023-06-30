import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Widget? icon;
  final Color? color;
  final Color? textColor;

  const DButton(
      {super.key,
      required this.text,
      this.onPress,
      this.icon,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(15.sp),
      child: Container(
        width: 100.w,
        height: 9.h,
        decoration: BoxDecoration(
            color: color ?? const Color(0xFF5666d8),
            borderRadius: BorderRadius.circular(12.sp)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
