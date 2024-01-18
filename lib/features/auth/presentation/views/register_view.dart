import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/navigation_extension.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/features/auth/presentation/views/login_view.dart';
import 'package:shoes_app/features/home/presentation/views/home_view.dart';
import 'package:shoes_app/features/home/presentation/views/main_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 128.h),
              const TopTextsWidget(),
              SizedBox(height: 50.h),
              const InputFormWidgets(),
              SizedBox(height: 30.h),
              CustomButton(
                  function: () {
                    context.navigateToAndRemoveUntil(const MainView());
                  },
                  title: 'Sign Up',
                  color: AppColors.primaryColor,
                  textStyle: context.f20700?.copyWith(color: AppColors.white)),
              SizedBox(height: 45.h),
              const GoogleSiginWidget(),
              SizedBox(height: 50.h),
              const SignUpOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpOptionsWidget extends StatelessWidget {
  const SignUpOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ',
            style: context.f18600?.copyWith(color: AppColors.lightGrey)),
        InkWell(
            onTap: () {
              context.navigateToPage(const LoginView());
            },
            child: Text('Sign In Here', style: context.f18600)),
      ],
    );
  }
}

class GoogleSiginWidget extends StatelessWidget {
  const GoogleSiginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.add),
        const SizedBox(width: 10),
        Text('Sigin Up With Google ', style: context.f20500),
      ],
    );
  }
}

class InputFormWidgets extends StatelessWidget {
  const InputFormWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Name',
              style: context.f22600?.copyWith(color: AppColors.darkBlack)),
          SizedBox(height: 12.h),
          const CustomTextField(
            hintText: 'name',
          ),
          SizedBox(height: 20.h),
          Text('Email Address',
              style: context.f22600?.copyWith(color: AppColors.darkBlack)),
          SizedBox(height: 12.h),
          const CustomTextField(
            hintText: 'email',
          ),
          SizedBox(height: 20.h),
          Text('Password',
              style: context.f22600?.copyWith(color: AppColors.darkBlack)),
          SizedBox(height: 12.h),
          const CustomTextField(
            hintText: 'password',
            password: true,
          ),
        ],
      ),
    );
  }
}

class TopTextsWidget extends StatelessWidget {
  const TopTextsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Create Account!',
              textAlign: TextAlign.center,
              style: context.f30600?.copyWith(color: AppColors.darkBlack)),
          const SizedBox(height: 4),
          Text('Let’s Create Account Together',
              textAlign: TextAlign.center,
              style: context.f20500?.copyWith(color: AppColors.lightGrey)),
        ],
      ),
    );
  }
}
