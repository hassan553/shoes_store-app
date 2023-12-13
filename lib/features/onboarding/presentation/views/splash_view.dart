import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/utils/app_images.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(ImagesPaths.splashPng,
          fit: BoxFit.fill,
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight),
    );
  }
}
