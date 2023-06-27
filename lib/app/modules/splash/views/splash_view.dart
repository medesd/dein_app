import 'package:dein_app/res/assets_res.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsRes.LOGO,
              height: 8.h,
              width: 8.h,
            ),
            SizedBox(
              height: 3.h,
            ),
            Image.asset(
              AssetsRes.LOGO_NAME,
              width: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
