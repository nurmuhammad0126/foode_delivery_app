import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import '../../../../core/widgets/widget_arrow_back_button.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  State<ForgetPasswordOtpScreen> createState() =>
      _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSpacing = 16.0;
    final boxCount = 4;
    final horizontalPadding = 24.0 * 2;
    final totalSpacing = (boxCount - 1) * boxSpacing;
    final boxWidth =
        (screenWidth - horizontalPadding - totalSpacing) / boxCount;

    final defaultPinTheme = PinTheme(
      width: boxWidth,
      height: 60,
      textStyle: AppTextStyles.s24w700.copyWith(color: AppColors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.gray100),
        boxShadow: [
          BoxShadow(
            blurRadius: 60,
            spreadRadius: 5,
            offset: Offset(12, 30),
            color: AppColors.shadowBlue,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          24.height,
          const WidgetArrowBackButton(text: "Forgot password"),
          Spacer(),

          Column(
            children: [
              Text(
                "Code has been send to +6282******39",
                style: AppTextStyles.s16w400,
              ),
              60.height,
              Pinput(
                length: boxCount,
                controller: pinController,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => SizedBox(width: boxSpacing),
                showCursor: true,
                onCompleted: (value) {},
              ),
              60.height,
              WRichText(text1: "Resent coed in ", text2: "56 s"),
            ],
          ),

          Spacer(),
          WScaleAnimation(
            onTap: () {},
            child: WGradientContainer(
              child: Text(
                "Next",
                textAlign: TextAlign.center,
                style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ).paddingAll(24.w),
    );
  }
}
