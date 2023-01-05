import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picpro/controllers/camera_controller.dart';
import 'package:picpro/core/colors/colors.dart';
import 'package:picpro/views/splash/screen_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var controller = Get.put(CameraXController());

  try {
    var cameras = await availableCameras();
    controller.cameras = cameras;
    controller.getCameraInstance();
  } on CameraException {
    log('camera fetching error');
  } catch (e) {
    log(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PicPro',
      theme: ThemeData(
          primaryColor: kWhite,
          primarySwatch: kGrey,
          scaffoldBackgroundColor: kWhite,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBlack,
            centerTitle: true,
          )),
      home: ScreenSplash(),
    );
  }
}
