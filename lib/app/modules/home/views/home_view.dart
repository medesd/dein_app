
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget navigationItem(
      String icon, String text, Color color, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              scale: .9.sp,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 9.sp, color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp)),
        ),
        child: Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navigationItem(
                  AssetsRes.SEARCH,
                  "Search",
                  controller.navigationIndex.value == 0
                      ? const Color(0xff5666d8)
                      : const Color(0xffc8c9d4),
                  () => controller.navigationIndex(0),
                ),
                navigationItem(
                  AssetsRes.MESSAGE,
                  "Messages",
                  controller.navigationIndex.value == 1
                      ? const Color(0xff5666d8)
                      : const Color(0xffc8c9d4),
                  () => controller.navigationIndex(1),
                ),
                navigationItem(
                  AssetsRes.SETTINGS,
                  "Settings",
                  controller.navigationIndex.value == 2
                      ? const Color(0xff5666d8)
                      : const Color(0xffc8c9d4),
                  () => controller.navigationIndex(2),
                ),
              ],
            )),
      ),
      body: SafeArea(
        child: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: controller.tabs),
      ),
    );
  }
}
