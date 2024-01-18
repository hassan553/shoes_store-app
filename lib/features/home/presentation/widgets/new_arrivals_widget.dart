import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class NewArrivalsShoesWidget extends StatelessWidget {
  const NewArrivalsShoesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.white),
      height: 150.h,
      width: ScreenUtil().screenWidth,
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Best Seller',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.f16600
                          ?.copyWith(color: AppColors.primaryColor),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Nike Air Max 270',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.f20700,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '\$ 200.00',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.f16600
                          ?.copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                ImagesPaths.shoes1Png,
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      }),
    );
  }
}
