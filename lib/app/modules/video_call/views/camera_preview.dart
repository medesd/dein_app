import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names
enum CameraOption { Front, Back }

class CallCameraPreview extends StatefulWidget {
  const CallCameraPreview({
    super.key,
    required this.cameraOption,
    required this.onCapture,
  });

  final Function(File) onCapture;
  final CameraOption cameraOption;

  @override
  CallCameraPreviewState createState() => CallCameraPreviewState();
}

class CallCameraPreviewState extends State<CallCameraPreview> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  bool isInitializing = true;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    findCameras();
  }

  findCameras() async {
    final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
    final firstCamera = cameras;
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameraOption == CameraOption.Front
          ? firstCamera[1]
          : firstCamera[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    isInitializing = false;
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return SafeArea(
      child: isInitializing
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }
}
