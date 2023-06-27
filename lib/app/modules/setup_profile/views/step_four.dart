import 'package:dein_app/app/widgets/d_button.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
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
          "When's your birthday",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF292c57),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),

        SizedBox(
          height: 16.h,
          child: ScrollDatePicker(
            options: const DatePickerOptions(
              itemExtent: 50,
            ),
            indicator: Container(
              height: 16.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.15),
                      borderRadius: BorderRadius.circular(4)),
                  width: 90.w,
                  height: 50,
                ),
              ),
            ),
            selectedDate: DateTime.now(),
            onDateTimeChanged: (date) {},
          ),
        ),
      ],
    );
  }
}
