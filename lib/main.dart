import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/features/home/presentation/views/favorite_view.dart';
import 'package:shoes_app/features/home/presentation/views/home_view.dart';
import 'core/utils/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'features/onboarding/presentation/views/splash_view.dart';
import 'features/home/presentation/views/product_details_view.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          title: 'NIKE ',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          home: const SplashView(),
        );
      },
    );
  }
}
