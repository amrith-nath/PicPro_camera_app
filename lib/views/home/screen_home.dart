import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:picpro/controllers/camera_controller.dart';
import 'package:picpro/core/colors/colors.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final CameraXController _cameraXController = Get.find();
  final FaceDetectorOptions faceOptions = FaceDetectorOptions();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (!_cameraXController.isCameraInitialized) {
          _cameraXController.initializeCamera();
        }
      },
    );

    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: kBlack,
              height: 40,
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GetBuilder(
                    init: CameraXController(),
                    builder: (camera) {
                      if (camera.isCameraInitialized) {
                        return camera.camera!.buildPreview();
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
            Container(
              color: kBlack,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
