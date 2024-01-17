import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/core/extension/navigation_extension.dart';
import 'package:shoes_app/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.navigateToPage(const OnBoardingView());
    });
  }

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
