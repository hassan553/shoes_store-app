import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_colors.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/core/widgets/custom_text_button.dart';
import 'package:shoes_app/core/widgets/custom_text_field.dart';
import 'package:shoes_app/features/home/presentation/widgets/popular_shoes_widget.dart';

import '../widgets/new_arrivals_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List companysLogo = [
    {'image': ImagesPaths.nikeLogoPng, 'name': 'NIKE'},
    {'image': ImagesPaths.adidasPng, 'name': 'ADIDAS'},
    {'image': ImagesPaths.pumaPng, 'name': 'PUMA'},
    {'image': ImagesPaths.reebokLogoPng, 'name': 'REEBOK'},
    {'image': ImagesPaths.converseLogoPng, 'name': 'CONVERSE'},
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
            const CustomTextField(
              prefixIcon: Icon(Icons.search_sharp),
              hintText: 'Looking for shoes',
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 55.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: currentIndex == index
                      ? Container(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.primaryColor),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.white,
                                child: Image.asset(companysLogo[index]['image'],
                                    fit: BoxFit.fill),
                              ),
                              const SizedBox(width: 5),
                              Text(companysLogo[index]['name'],
                                  style: context.f16700
                                      ?.copyWith(color: AppColors.white)),
                            ],
                          ),
                        )
                      : CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.white,
                          child: Image.asset(companysLogo[index]['image'],
                              fit: BoxFit.fill),
                        ),
                ),
                itemCount: companysLogo.length,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Shoes', style: context.f20700),
                CustomTextButton(
                  onTap: () {},
                  text: 'See All',
                  style:
                      context.f18600?.copyWith(color: AppColors.primaryColor),
                )
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const PopularShoesWidget(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 16.h),
                  itemCount: 100),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Arrivals', style: context.f20700),
                CustomTextButton(
                  onTap: () {},
                  text: 'See All',
                  style:
                      context.f18600?.copyWith(color: AppColors.primaryColor),
                )
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) => const NewArrivalsShoesWidget(),
                shrinkWrap: true,
                itemCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

