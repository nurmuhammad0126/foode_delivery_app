import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/widgets/widget_arrow_back_button.dart';

class SetLoacationScreen extends StatefulWidget {
  const SetLoacationScreen({super.key});

  @override
  State<SetLoacationScreen> createState() => _SetLoacationScreenState();
}

class _SetLoacationScreenState extends State<SetLoacationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        spacing: 24.h,
        children: [
          24.height,
          WidgetArrowBackButton(text: "Set your location"),
          Text(
            "This data will be displayed in your account profile for security",
            style: AppTextStyles.s18w400,
          ),

          // WScaleAnimation(
          //   onTap: () {},
          //   child: WidgetForSetButton(
          //     text: 'Set location',
          //     icons: Icons.location_on,
          //   ),
          // ),
          Expanded(
            child: WContainerWithShadow(
              width: double.infinity,
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 2),
              child: Center(child: Text("Map Bolishi kerak")),
            ),
          ),
          WContainerWithShadow(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary, width: 2),
            child: Row(
              spacing: 20.w,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary100,
                  ),
                  child: Icon(Icons.location_pin, color: AppColors.primary),
                ),
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      Text("Bung Tomo St. 109", style: AppTextStyles.s16w700),
                    ],
                  ),
                ),
                WGradientContainer(
                  padding: EdgeInsets.all(6.w),
                  height: null,
                  borderRadius: BorderRadius.circular(10),
                  child: Icon(Icons.edit, color: AppColors.white, size: 16.w),
                ),
              ],
            ),
          ),
          Spacer(),
          WScaleAnimation(
            onTap: () {},
            child: WGradientContainer(
              child: Text(
                "Set Location",
                style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ).paddingAll(24.w),
    );
  }
}
