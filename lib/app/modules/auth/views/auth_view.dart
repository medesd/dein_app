import 'package:dein_app/app/routes/app_pages.dart';
import 'package:dein_app/app/widgets/d_button.dart';
import 'package:dein_app/app/widgets/d_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../res/assets_res.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
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
              SizedBox(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Login with your SwissID",
                      style: TextStyle(
                        color: const Color(0xff292c57),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Image.asset(
                      AssetsRes.INFO,
                      scale: 4.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              DTextField(
                placeHolder: "Email Address",
                onChanged: (val)=>controller.email(val),
                defaultValue: "example@example.com",
              ),
              SizedBox(
                height: 3.h,
              ),
              DTextField(
                placeHolder: "Password",
                onChanged: (val)=>controller.password(val),
                hidden: true,
                defaultValue: "12345678",
              ),
              SizedBox(
                height: 4.h,
              ),
              DButton(
                text: "Login",
                onPress: controller.submitForm,
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Need help signing in?",
                  style: TextStyle(
                    color: Color(0xFF5666d8),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
