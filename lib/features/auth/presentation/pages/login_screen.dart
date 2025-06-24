import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Image.asset(
            Assets.logo,
          ).paddingOnly(left: 90.w, right: 90.w, top: 24.w),
          Text("Sign in to your account", style: AppTextStyles.s22w600),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.w,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Email",
                    style: AppTextStyles.s16w600,
                    children: [
                      TextSpan(
                        text: "*",
                        style: AppTextStyles.s16w600.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                WTextField(),
                Text("Password", style: AppTextStyles.s16w600),

                RichText(
                  text: TextSpan(
                    text: "Email",
                    style: AppTextStyles.s16w600,
                    children: [
                      TextSpan(
                        text: "*",
                        style: AppTextStyles.s16w600.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 24.w),
          ),
        ],
      ),
    );
  }
}
