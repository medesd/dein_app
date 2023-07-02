import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/setup_profile/controllers/setup_profile_controller.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StepSix extends StatefulWidget {
  const StepSix({super.key});

  @override
  State<StepSix> createState() => _StepSixState();
}

class _StepSixState extends State<StepSix> {
  var controller = Get.put(SetupProfileController());
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Your Skills",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF292c57),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        DTextField(
          withShadow: false,
          controller: textController,
          withBorder: true,
          placeHolder: "Skills",
          suffix: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 2.w, bottom: 2.w, right: 2.w),
              child: GestureDetector(
                onTap: () {
                  if (textController.text.isEmpty) return;
                  controller.addSkill(textController.text);
                },
                child: Image.asset(
                  AssetsRes.PLUS_FILLED,
                  scale: 1.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Obx(() => Wrap(
              spacing: 2.w,
              runSpacing: 1.h,
              children: controller.dataController.skills
                  .asMap()
                  .map((key, element) => MapEntry(
                      key,
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffeaeaea),
                          ),
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.sp),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(element),
                              InkWell(
                                borderRadius: BorderRadius.circular(20.sp),
                                onTap: () {
                                  controller.removeSkill(key);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: const Color(0xff292c57),
                                  size: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      )))
                  .values
                  .toList(),
            )),
      ],
    );
  }
}
