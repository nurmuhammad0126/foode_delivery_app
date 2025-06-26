import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';

import '../../../../core/widgets/w_gradient_container.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';
import '../widgets/widget_for_change_forget_password.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        spacing: 24.w,
        children: [
          24.height,
          WidgetArrowBackButton(text: "Forgot password?"),
          Text(
            "Select which contact details should we use to reset your password",
            style: AppTextStyles.s16w400,
          ),

          WidgetForChangeForgetPassword(
            text1: "via SMS:",
            text2: '+6282******39',
            icons: Icons.message,
            isSelected: true,
          ),
          WidgetForChangeForgetPassword(
            text1: "via Email:",
            text2: 'ex***le@yourdomain.com',
            icons: Icons.email,
            isSelected: false,
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
