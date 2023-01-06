import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraService {
  CameraController? getCameraInstance(CameraDescription camDes) {
    return CameraController(camDes, ResolutionPreset.high);
  }

  Future<bool?> takePicture(CameraController? camera) async {
    XFile image = await camera!.takePicture();

    return await GallerySaver.saveImage(image.path);
  }

  Future<void> initializeCamera(CameraController? camera) async {
    await camera!.initialize().then((value) {}).catchError((e) {
      if (e is CameraException) {
        log('Camera access denied');
      }
    });
  }
}
