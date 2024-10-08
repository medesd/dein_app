import 'package:dein_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:dein_app/app/modules/splash/views/splash_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:dein_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const DeinApp());
}

class DeinApp extends StatelessWidget {
  const DeinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        Future.delayed(Duration.zero)
            .then((value) => Get.put(SplashController()));
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'dein.app',
          getPages: AppPages.routes,
          home: const SplashView(),
        );
      },
    );
  }
}
