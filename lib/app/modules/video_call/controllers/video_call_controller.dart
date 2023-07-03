import 'dart:async';
import 'dart:io';

import 'package:dein_app/res/assets_res.dart';
import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:video_player/video_player.dart';

class VideoCallController extends GetxController {
  var toggleVideo = false.obs;
  var toggleMic = false.obs;
  var switchCamera = true.obs;
  var recordingStarted = false.obs;
  var videoCallStatus = "Calling".obs;
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  final callStopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  var callStarted = false.obs;
  var calEnded = false.obs;
  var callForced = false.obs;

  late VideoPlayerController videoController;
  late VideoPlayerController audioController;


  @override
  void onInit() {
    super.onInit();
    audioController = VideoPlayerController.asset(AssetsRes.RINGING)
      ..initialize().then((value){
        audioController.play();
        callForced.listen((p0) {
          audioController.dispose();
        });
      });
    Future.delayed(const Duration(seconds: 4)).then((value) {
      videoCallStatus("Ringing");
      Future.delayed(const Duration(seconds: 6)).then((value) {
        audioController.dispose();
        callStopWatchTimer.onStartTimer();
        callStarted(true);
        if (!callForced.value) {
          videoController.play();
        }
        Future.delayed(
          const Duration(seconds: 39),
        ).then(
          (value) {
            if (!callForced.value) {
              Future.delayed(const Duration(seconds: 2))
                  .then((value) => Get.back());
            }
            calEnded(true);
            videoController.dispose();
          },
        );
      });
    });
    videoController = VideoPlayerController.asset(AssetsRes.VIDEO_CALL)
      ..initialize();
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
