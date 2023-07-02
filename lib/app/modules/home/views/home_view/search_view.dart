import 'dart:io';

import 'package:dein_app/app/data/data_controller.dart';
import 'package:dein_app/app/modules/home/controllers/home_controller.dart';
import 'package:dein_app/app/modules/home/views/home_view/matches.dart';
import 'package:dein_app/app/modules/home/views/home_view/search_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../res/assets_res.dart';
import 'match_container.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SingleChildScrollView(
        physics: controller.touchedUser.value != 0
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        child: controller.touchedUser.value == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25.sp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.sp),
                          child: Obx(
                            () => DataController.avatar.isEmpty
                                ? Image.asset(AssetsRes.AVATAR)
                                : Image.file(
                                    File(DataController.avatar.value),
                              width: 40.w,
                              height: 40.w,
                              fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Obx(
                      () => Text(
                        "Good morning,\n${DataController.name.value.isNotEmpty ? DataController.name.value : "David"}.",
                        style: TextStyle(
                            color: const Color(0xff292c57),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    color: const Color(0xfff1f6fd),
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Obx(() {
                      switch (controller.searchMode.value) {
                        case 0:
                          return const SearchContainer();
                        case 1:
                          return const MatchContainer();
                        default:
                          return const SearchContainer();
                      }
                    }),
                  ),
                ],
              )
            : const Matches(),
      );
      },
    );
  }
}
