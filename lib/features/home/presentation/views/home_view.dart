import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_colors.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/core/widgets/custom_text_button.dart';
import 'package:shoes_app/core/widgets/custom_text_field.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
    return Scaffold(
      appBar: AppBar(title: const Text('home view ')),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
            const CustomTextField(
              prefixIcon: Icon(Icons.search_sharp),
              hintText: 'Looking for shoes',
            ),
            SizedBox(height: 25.h),
            Container(
              child: SizedBox(
                height: 55,
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
                            padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.primaryColor),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.white,
                                  child: Image.asset(
                                      companysLogo[index]['image'],
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
                      context.f20700?.copyWith(color: AppColors.primaryColor),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white),
              height: 200.h,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
