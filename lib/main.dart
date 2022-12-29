import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picpro/core/colors/colors.dart';
import 'package:picpro/views/splash/screen_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
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
      ),
      home: ScreenSplash(),
    );
  }
}
