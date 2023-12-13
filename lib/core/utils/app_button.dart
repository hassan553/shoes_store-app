import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String? text;
  final double? fontSize;
  final AppButtonType type;
  final bool loading;

  Widget? child;
  late final Color? color;
  late final Gradient? gradient;
  late final BorderRadiusGeometry borderRadius;
  late final Color? primaryColor;
  late final TextStyle? textStyle;
  late final EdgeInsets padding;

  AppButton(
      {Key? key,
      required this.onPressed,
      this.child,
      this.width,
      this.height,
      this.text,
      this.fontSize,
      this.type = AppButtonType.solidPrimary,
      this.loading = false})
      : super(key: key) {
    color = switch (type) {
      AppButtonType.solidPrimary => AppColors.primaryColor,
      _ => null
    };

   

    borderRadius = switch (type) {
      AppButtonType.solidPrimary => BorderRadius.circular(16),
      AppButtonType.gradientPrimary => BorderRadius.circular(90),
      _ => BorderRadius.circular(16)
    };

    primaryColor = switch (type) {
      AppButtonType.solidPrimary => AppColors.primaryColor,
      _ => AppColors.primaryColor
    };

    padding = switch (type) {
      AppButtonType.solidPrimary =>
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
      _ => EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w)
    };
  }

  @override
  Widget build(BuildContext context) {
    textStyle = switch (type) {
      AppButtonType.solidPrimary => context.f16700,
      _ => context.f16700
    };

    child ??= switch (type) {
      AppButtonType.gradientPrimary => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                text ?? '',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_sharp,
                  color: AppColors.white.withOpacity(0.3), size: 20),
              Icon(Icons.arrow_forward_ios_sharp,
                  color: AppColors.white.withOpacity(0.6), size: 20),
              Icon(Icons.arrow_forward_ios_sharp,
                  color: AppColors.white.withOpacity(1.0), size: 20)
            ],
          ),
        ),
      _ => null
    };

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      padding: EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPrimary: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            padding: EdgeInsets.zero),
        child: Container(
          alignment: Alignment.center,
          padding: padding,
          child: loading
              ? const CircularProgressIndicator()
              : child ??
                  Text(
                    text ?? '',
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
        ),
      ),
    );
  }
}

enum AppButtonType { solidPrimary, gradientPrimary }
