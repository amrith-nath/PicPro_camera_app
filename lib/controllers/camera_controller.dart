import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:picpro/services/camera_service.dart';

class CameraXController extends GetxController {
  CameraService _cameraService = CameraService();

  bool isCameraInitialized = false;

  CameraController? camera;
  List<CameraDescription> cameras = [];

  getCameraInstance() {
    camera = _cameraService.getCameraInstance(cameras[1]);
    return camera;
  }

  void initializeCamera() async {
    await _cameraService.initializeCamera(camera);

    camera!.startImageStream((CameraImage image) async {
      log('Stream started from getx');
    });
    isCameraInitialized = true;
    update();
  }

  @override
  void dispose() {
    camera!.dispose();
    super.dispose();
  }
}
