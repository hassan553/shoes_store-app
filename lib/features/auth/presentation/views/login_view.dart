import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/core/extension/text_theme_extension.dart';
import 'package:shoes_app/core/utils/app_colors.dart';
import 'package:shoes_app/core/widgets/custom_button.dart';

import '../../../../core/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  function: () {},
                  title: 'Sign In',
                  color: AppColors.primaryColor,
                  textStyle: context.f20700?.copyWith(color: AppColors.white)),
              SizedBox(height: 45.h),
              const GoogleSiginWidget(),
              SizedBox(height: 133.h),
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
        Text('Don`t have an account? ',
            style: context.f18600?.copyWith(color: AppColors.lightGrey)),
        InkWell(
            onTap: () {}, child: Text('Sign Up Here', style: context.f18600)),
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
        Text('Sigin In With Google ', style: context.f20500),
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
          Text('Email Address',
              style: context.f22600?.copyWith(color: AppColors.darkBlack)),
          SizedBox(height: 12.h),
          const CustomTextField(
            hintText: 'email',
          ),
          SizedBox(height: 30.h),
          Text('Password',
              style: context.f22600?.copyWith(color: AppColors.darkBlack)),
          SizedBox(height: 12.h),
          const CustomTextField(
            hintText: 'password',
            password: true,
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
                onTap: () {},
                child: Text(
                  'Forget Password ?',
                  style: context.f18600?.copyWith(color: AppColors.lightGrey),
                )),
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
          Text('Hello Again!',
              textAlign: TextAlign.center,
              style: context.f30600?.copyWith(color: AppColors.darkBlack)),
          const SizedBox(height: 4),
          Text('Welcome Back You’ve Been Missed!',
              textAlign: TextAlign.center,
              style: context.f20500?.copyWith(color: AppColors.lightGrey)),
        ],
      ),
    );
  }
}
