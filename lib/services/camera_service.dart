import 'dart:developer';

import 'package:camera/camera.dart';

class CameraService {
  CameraController? getCameraInstance(CameraDescription camDes) {
    return CameraController(camDes, ResolutionPreset.high);
  }

  Future<void> initializeCamera(CameraController? camera) async {
    await camera!.initialize().then((value) {}).catchError((e) {
      if (e is CameraException) {
        log('Camera access denied');
      }
    });
  }
}
