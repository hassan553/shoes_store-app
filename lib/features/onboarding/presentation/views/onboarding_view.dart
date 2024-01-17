import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/navigation_extension.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_images.dart';
import 'package:shoes_app/core/widgets/custom_button.dart';
import 'package:shoes_app/features/auth/presentation/views/login_view.dart';
import 'package:shoes_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();
  int count = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _backgroundImages(),
          PageView.builder(
              itemCount: onBoardingData.length,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  count = value;
                });
                if (count == 3) {
                  context.navigateToAndRemoveUntil(const LoginView());
                }
              },
              itemBuilder: (context, index) =>
                  _onboardingBody(context, onBoardingData[index])),
        ],
      ),
    );
  }

  Padding _onboardingBody(BuildContext context, OnBoardingModel model) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _centerImage(model.imagePath),
          _bodyTexts(context, model.title, model.subTitle),
          SizedBox(height: 30.h),
          _bottomButtons(context)
        ],
      ),
    );
  }

  Row _bottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 16.h, dotWidth: 16.w, expansionFactor: 3),
          ),
        ),
        const Spacer(),
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CustomButton(
                function: () {
                  if (count > onBoardingData.length) {
                    print(count);
                    context.navigateToAndRemoveUntil(const LoginView());
                  }
                  if (count < onBoardingData.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                    setState(() {
                      count++;
                    });
                  }
                },
                title: 'Get Start',
                color: AppColors.primaryColor,
                textStyle: context.f21700?.copyWith(color: AppColors.white),
              ),
            )),
      ],
    );
  }

  Column _bodyTexts(BuildContext context, String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.f28800?.copyWith(color: AppColors.darkBlack),
        ),
        const SizedBox(height: 10),
        Text(
          subTitle,
          style: context.f20700?.copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }

  Stack _centerImage(String image) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(image, fit: BoxFit.fill),
        Image.asset(ImagesPaths.dotPng, fit: BoxFit.fill),
      ],
    );
  }

  Column _backgroundImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(ImagesPaths.topCirclePng),
        ),
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Image.asset(ImagesPaths.nikePng),
        ),
      ],
    );
  }
}
