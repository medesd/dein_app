import 'dart:async';
import 'dart:io';

import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class VideoCallController extends GetxController {
  var toggleVideo = false.obs;
  var toggleMic = false.obs;
  var switchCamera = true.obs;
  var recordingStarted = false.obs;
  var videoCallStatus = "Calling".obs;
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  final callStopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  var callStarted = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      videoCallStatus("Raining");
      Future.delayed(const Duration(seconds: 3)).then((value) {
        callStopWatchTimer.onStartTimer();
        callStarted(true);
      });
    });
  }

  Future<void> startRecord({required String fileName}) async {
    try {
      recordingStarted(true);
      stopWatchTimer.onStartTimer();
    } on PlatformException {
      Logger().e("Error: An error occurred while starting the recording!");
    }
  }

  Future<void> stopRecord() async {
    recordingStarted(false);
    stopWatchTimer.onStopTimer();
    stopWatchTimer.onResetTimer();
  }
}
