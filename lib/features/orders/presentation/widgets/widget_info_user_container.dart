import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';
import '../../../../core/widgets/w_gradient_container.dart';

class WidgetInfoUserContainer extends StatefulWidget {
  final double mediaQueryHeight;
  final double mediaQueryWidth;
  final String image;
  final String title1;
  final String title2;
  final String title3;

  const WidgetInfoUserContainer({
    super.key,
    required this.mediaQueryHeight,
    required this.mediaQueryWidth,
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  @override
  State<WidgetInfoUserContainer> createState() =>
      _WidgetInfoUserContainerState();
}

class _WidgetInfoUserContainerState extends State<WidgetInfoUserContainer> {
  @override
  Widget build(BuildContext context) {
    return WContainerWithShadow(
      margin: EdgeInsets.only(bottom: 24.w),
      clipBehavior: Clip.hardEdge,
      color: AppColors.white,
      border: Border.all(color: AppColors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.person, width: 50, height: 50),
          20.width,
          SizedBox(
            width: widget.mediaQueryWidth * 0.48,
            child: Column(
              spacing: 4.w,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title1, style: AppTextStyles.s18w600),
                Text(
                  widget.title2,
                  style: AppTextStyles.s10w400.copyWith(color: AppColors.gray),
                ),
                Text(widget.title3, style: AppTextStyles.s14w400),
              ],
            ),
          ),
          Spacer(),
          WGradientContainer(
            width: widget.mediaQueryWidth * 0.12,
            height: widget.mediaQueryHeight * 0.04,
            padding: EdgeInsets.all(8.w),
            borderRadius: BorderRadius.circular(9.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_sharp, color: AppColors.white, size: 15),
                Text(
                  "5",
                  style: AppTextStyles.s14w600.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
