import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';

class RowWidget extends StatelessWidget {
  final String title;
  const RowWidget({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.s20w600),
                Text(
                  "See all",
                  style: AppTextStyles.s16w600.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            );
  }
}