import 'package:flutter/material.dart';
import 'package:picpro/core/colors/colors.dart';
import 'package:picpro/core/fonts/fonts.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Center(
          child: CircleAvatar(
            radius: 80,
            backgroundColor: kBlack,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PIC ',
                      style: GoogleFont.splashTextStyle,
                    ),
                    Text(
                      'PRO',
                      style: GoogleFont.splashTextStyleRed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
