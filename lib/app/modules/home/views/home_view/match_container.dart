import 'package:dein_app/app/modules/home/controllers/home_controller.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../res/assets_res.dart';

class MatchContainer extends GetView<HomeController> {
  const MatchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
          Obx(() => DTextField(
                withShadow: false,
                defaultValue: controller.keyword.value,
                onChanged: (val) =>
                    controller.keyword(val.toLowerCase().replaceAll(" ", "_")),
                suffix: Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 1.h, right: 1.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.searchMode(1);
                      },
                      child: Image.asset(
                        AssetsRes.SEARCH_FILLED,
                        scale: 1.sp,
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Your matches",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff292c57),
            ),
          ),
          if (controller.searchItems.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: Text(
                  "no result",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          SizedBox(
            height: 4.h,
          ),
          Wrap(
            spacing: 2.w,
            runSpacing: 2.w,
            children: controller.searchItems
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      controller.touchedUser(e.id);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 24.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: const Color(0xffb7bfc5),
                              borderRadius: BorderRadius.circular(15.sp),
                              image: DecorationImage(
                                  image: AssetImage(e.images!.first))),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          e.name!,
                          style: const TextStyle(
                              color: Color(0xff292c57),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
