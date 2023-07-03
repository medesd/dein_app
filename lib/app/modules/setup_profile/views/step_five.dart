import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:sizer/sizer.dart';

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Whats your name?",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF292c57),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        DTextField(
          placeHolder: "Name",
          withShadow: false,
          withBorder: true,
          onChanged: (val) {
            if (val.isEmpty) return;
            DataController.name(val);
          },
        ),
        SizedBox(
          height: 2.h,
        ),
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
            onDateTimeChanged: (date) {
             DataController.birthday(date);
            },
          ),
        ),
      ],
    );
  }
}
