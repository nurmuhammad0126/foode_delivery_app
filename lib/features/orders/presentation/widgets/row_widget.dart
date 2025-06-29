import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const RowWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.s20w600),
        onTap == null
            ? Text(
              "See all",
              style: AppTextStyles.s16w600.copyWith(color: AppColors.primary),
            )
            : WScaleAnimation(
              onTap: onTap,
              child: Text(
                "See all",
                style: AppTextStyles.s16w600.copyWith(color: AppColors.primary),
              ),
            ),
      ],
    );
  }
}
