import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          24.height,
          WidgetArrowBackButton(text: "Reset password"),
          24.height,
          Text("Create a new password", style: AppTextStyles.s16w400),
          24.height,
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WRichText(
                  text1: "New Password",
                  text2: "*",
                ).paddingOnly(left: 24),
                8.height,
                WTextField(controller: _passwordController),
                24.height,

                WRichText(
                  text1: "Confirm New Password",
                  text2: "*",
                ).paddingOnly(left: 24),
                8.height,
                WTextField(controller: _passwordConfirmController),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                checkColor: AppColors.white,
                activeColor: AppColors.primary,
              ),
              Text("Remember me", style: AppTextStyles.s14w600),
            ],
          ),
          Spacer(),
          WGradientContainer(
            child: Text(
              "Next",
              style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ).paddingAll(24.w),
    );
  }
}
