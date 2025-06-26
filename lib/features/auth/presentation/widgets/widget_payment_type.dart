import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';

class WidgetPaymentType extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isSelected;
  const WidgetPaymentType({
    super.key,
    required this.child,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WContainerWithShadow(
        width: double.infinity,
        borderRadius: BorderRadius.circular(24.w),
        border:
            isSelected
                ? Border.all(
                  color: AppColors.primary.withOpacity(0.7),
                  width: 2.w,
                )
                : null,
        color: color,
        child: child,
      ),
    );
  }
}
