import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class PopularShoesWidget extends StatelessWidget {
  const PopularShoesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.white),
      height: 200.h,
      width: 200.w,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImagesPaths.shoes1Png,
                fit: BoxFit.fill,
                width: constraints.maxWidth * .8,
                height: constraints.maxHeight / 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Seller',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        context.f16600?.copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(height: 2.h),
                  const Text(
                    'Nike Air Max 270',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    'Nike Air Max 270',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        context.f16600?.copyWith(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: AppColors.primaryColor),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
