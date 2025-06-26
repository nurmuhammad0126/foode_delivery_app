import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';

class WidgetCustomChip extends StatefulWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const WidgetCustomChip({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  @override
  State<WidgetCustomChip> createState() => _WidgetCustomChipState();
}

class _WidgetCustomChipState extends State<WidgetCustomChip> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
        widget.onTap();
      },
      child: WContainerWithShadow(
        shadow: [],
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
        margin: EdgeInsets.only(right: 10, bottom: 10),
        borderRadius: BorderRadius.circular(32),
        color: isSelected ? AppColors.colorForChip : AppColors.white,
        border: Border.all(color: AppColors.colorForChip, width: 2.w),
        child: Text(
          widget.text,
          style: AppTextStyles.s16w600.copyWith(
            color: isSelected ? AppColors.white : AppColors.colorForChip,
          ),
        ),
      ),
    );
  }
}
