import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';

class WidgetForChangeForgetPassword extends StatelessWidget {
  final IconData icons;
  final String text1;
  final String text2;
  final bool isSelected;
  const WidgetForChangeForgetPassword({
    super.key,
    required this.icons,
    required this.text1,
    required this.text2,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return WContainerWithShadow(
      color: AppColors.white,
      border:
          isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
      borderRadius: BorderRadius.circular(20.w),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary100,
            ),
            child: Icon(icons, color: AppColors.primary).paddingAll(24.w),
          ),
          20.width,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s14w400.copyWith(color: AppColors.gray),
                ),
                6.height,
                Text(
                  text2,
                  maxLines: 1,
                  style: AppTextStyles.s18w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
