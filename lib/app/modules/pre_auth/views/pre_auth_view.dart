import 'package:dein_app/app/widgets/d_button.dart';
import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/pre_auth_controller.dart';

class PreAuthView extends GetView<PreAuthController> {
  const PreAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f6fd),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Image.asset(AssetsRes.PRE_AUTH_INTRO),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Discover services",
              style: TextStyle(
                color: Color(0xFF292c57),
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: const Text(
                "Connect and match based one personal\ninterests and region",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff646681)),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            DButton(
              text: "Continue with google",
              color: Colors.white,
              textColor: Color(0xff292c57),
              icon: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Image.asset(
                  AssetsRes.GOOGLE,
                  scale: 3.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            DButton(
              text: "Register with Email",
              onPress: ()=>Get.toNamed(Routes.AUTH),
              color: Colors.white,
              textColor: Color(0xff292c57),
              icon: Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: Image.asset(
                  AssetsRes.EMAIL,
                  scale: 3.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            DButton(
              text: "Continue with SwissID",
              onPress: ()=>Get.toNamed(Routes.AUTH),
              color: Color(0xff5666d8),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AssetsRes.SWISS_ID,
                  scale: 3.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
