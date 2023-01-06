import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:picpro/services/camera_service.dart';
import 'package:picpro/services/model_service.dart';

class CameraXController extends GetxController {
//------------------------------------//

  final CameraService _cameraService = CameraService();
  final ModelService _modelService = ModelService();
//------------------------------------//
  @override
  void onInit() {
    _modelService.loadModel();
    super.onInit();
  }

//----------------------------------//
  CameraImage? cameraImage;
  Rx<String> expression = ''.obs;
  bool isCameraInitialized = false;
  bool isDetecting = false;
  Rx<bool> isTakingPicture = false.obs;

  CameraController? camera;
  List<CameraDescription> cameras = [];
//--------------------------------------//

  getCameraInstance() {
    camera = _cameraService.getCameraInstance(cameras[1]);
    return camera;
  }

  takePicture() async {
    isTakingPicture.value = true;
    var saved = await _cameraService.takePicture(camera);
    isTakingPicture.value = false;
    if (saved!) {
      Get.showSnackbar(const GetSnackBar(
        titleText: Text('Success'),
        messageText: Text('Image Saved'),
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        titleText: Text('Error'),
        messageText: Text('Sommething went Wrong'),
      ));
    }
  }

  void initializeCamera() async {
    await _cameraService.initializeCamera(camera);
    isCameraInitialized = true;
    update();
    // camera!.startImageStream((CameraImage image) async {
    //   cameraImage = image;

    //   if (!isDetecting) {
    //     isDetecting = true;
    //     var preidiction = await Tflite.runModelOnFrame(
    //       bytesList: image.planes.map((e) => e.bytes).toList(),
    //       imageHeight: image.height,
    //       imageWidth: image.width,
    //       imageMean: 127.5,
    //       imageStd: 127.5,
    //       rotation: 90,
    //       numResults: 2,
    //       threshold: 0.1,
    //       asynch: true,
    //     );

    //     for (var i in preidiction!) {
    //       expression.value = i['label'];
    //     }
    //     isDetecting = false;
    //   }

    //   log(expression.value);
    // });
  }

  @override
  void dispose() {
    camera!.dispose();
    super.dispose();
  }
}
