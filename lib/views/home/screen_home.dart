import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
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
              height: 20,
            ),
            Flexible(
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.circular(10),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Obx(() => Text(
                          _cameraXController.expression.value,
                          style: const TextStyle(color: kWhite),
                        )),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: kGrey, shape: BoxShape.circle),
                    width: 80,
                    height: 80,
                    child: Obx(
                      () => !_cameraXController.isTakingPicture.value
                          ? IconButton(
                              onPressed: () async {
                                _cameraXController.takePicture();
                              },
                              icon: const Icon(
                                Icons.circle,
                                color: kWhite,
                                size: 40,
                              ))
                          : const Center(
                              child: CircularProgressIndicator(
                                color: kBlack,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
