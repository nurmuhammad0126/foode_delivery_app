import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';

class WidgetForSetButton extends StatelessWidget {
  final String text;
  final IconData icons;
  const WidgetForSetButton({
    super.key,
    required this.text,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return WContainerWithShadow(
      width: double.infinity,
      borderRadius: BorderRadius.circular(20.w),
      height: MediaQuery.of(context).size.height * 0.17,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary100,
            ),
            child: Icon(icons, color: AppColors.primary).paddingAll(24.w),
          ),
          Text(text, style: AppTextStyles.s16w600),
        ],
      ),
    );
  }
}
