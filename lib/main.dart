import 'package:flutter/material.dart';
import 'package:picpro/presentation/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PicPro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}
