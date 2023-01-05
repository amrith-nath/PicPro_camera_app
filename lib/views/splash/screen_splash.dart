import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picpro/core/colors/colors.dart';
import 'package:picpro/core/constants/svg.dart';
import 'package:picpro/core/fonts/fonts.dart';
import 'package:picpro/views/home/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  Animation<double>? _secondAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 600,
        ));
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.off(() => ScreenHome(), transition: Transition.fade);
        // _animationController!.reset();
      }
    });
    _animation = Tween(begin: 1.0, end: 7.0).animate(_animationController!);
    _secondAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationController!);
    // _animationController!.forward();
    startNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AnimatedBuilder(
            animation: _animation!,
            builder: (context, _) {
              return Transform.scale(
                scale: _animation!.value,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: kBlack,
                  child: AnimatedBuilder(
                      animation: _secondAnimation!,
                      builder: (context, _) {
                        return Transform.scale(
                          scale: _secondAnimation!.value,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                splashIcon,
                                color: kWhite,
                                width: 50,
                              ),
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
                        );
                      }),
                ),
              );
            }),
      )),
    );
  }

  Future startNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
