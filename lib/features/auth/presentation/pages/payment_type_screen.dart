import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/auth/presentation/widgets/widget_payment_type.dart';

class PaymentTypeScreen extends StatefulWidget {
  const PaymentTypeScreen({super.key});

  @override
  State<PaymentTypeScreen> createState() => _VerifyBioScreenState();
}

class _VerifyBioScreenState extends State<PaymentTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.height,
          WidgetArrowBackButton(text: "Payment method"),
          24.height,
          Text(
            "This data will be displayed in your account profile for security",
            style: AppTextStyles.s16w400,
          ),
          24.height,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24.w,
              children: [
                WidgetPaymentType(
                  color: AppColors.white,
                  isSelected: true,
                  child: SvgPicture.asset(Assets.payPalLogo).paddingAll(8),
                ),
                WidgetPaymentType(
                  color: AppColors.white,
                  isSelected: false,
                  child: SvgPicture.asset(Assets.visaLogo).paddingAll(12),
                ),
                WidgetPaymentType(
                  color: AppColors.white,
                  isSelected: false,
                  child: SvgPicture.asset(Assets.payoneerLogo).paddingAll(8),
                ),
              ],
            ),
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
