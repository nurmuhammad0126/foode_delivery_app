import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';
import '../pages/home_screen.dart';

class WidgetRestoranDetailsContainer extends StatelessWidget {
  final RestoranItems restoranItems;
  final double widthC;
  final EdgeInsetsGeometry? margin;
  const WidgetRestoranDetailsContainer({
    super.key,
    required this.restoranItems,
    required this.widthC,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return WContainerWithShadow(
      borderRadius: BorderRadius.circular(24.w),
      border: Border.all(color: AppColors.white),
      margin: margin,
      width: widthC,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(restoranItems.iconAsset),
          24.height,
          Text(restoranItems.name, style: AppTextStyles.s18w600),
          4.height,
          Text(restoranItems.time, style: AppTextStyles.s14w400),
        ],
      ),
    );
  }
}
