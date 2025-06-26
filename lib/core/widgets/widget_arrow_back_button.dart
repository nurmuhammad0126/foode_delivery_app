import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class WidgetArrowBackButton extends StatelessWidget {
  final String text;
  const WidgetArrowBackButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24.w,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: AppColors.primary100,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 19.w,
              ),
            ),
          ),
        ),
        Text(text, style: AppTextStyles.s26w700),
      ],
    );
  }
}
