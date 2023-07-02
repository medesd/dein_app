import 'dart:io';

import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class VideoCallController extends GetxController {
  var toggleVideo = false.obs;
  var toggleMic = false.obs;
  var screenRecorder = EdScreenRecorder();

  Future<void> startRecord({required String fileName}) async {
    Directory? tempDir = await getApplicationDocumentsDirectory();
    String? tempPath = tempDir.path;
    try {
      await screenRecorder.startRecordScreen(
        fileName: "Eren",
        //Optional. It will save the video there when you give the file path with whatever you want.
        //If you leave it blank, the Android operating system will save it to the gallery.
        dirPathToSave: tempPath,
        audioEnable: true,
      );
    } on PlatformException {
      Logger().e("Error: An error occurred while starting the recording!");
    }
  }

  Future<void> stopRecord() async {
    var response = await screenRecorder.stopRecord();
  }
}

