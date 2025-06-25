import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/auth/presentation/widgets/widget_for_set_button.dart';

class UploadeImageScreen extends StatefulWidget {
  const UploadeImageScreen({super.key});

  @override
  State<UploadeImageScreen> createState() => _UploadeImageScreenState();
}

class _UploadeImageScreenState extends State<UploadeImageScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          24.height,
          WidgetArrowBackButton(text: "Upload your photo"),
          24.height,

          Text(
            "This data will be displayed in your account profile for security",
            style: AppTextStyles.s16w500,
          ),
          24.height,

          image == null
              ? Column(
                children: [
                  WScaleAnimation(
                    onTap: () {},
                    child: WidgetForSetButton(
                      text: "Take photo",
                      icons: Icons.camera_alt_rounded,
                    ),
                  ),
                  24.height,

                  WScaleAnimation(
                    onTap: () {},
                    child: WidgetForSetButton(
                      text: "From gallery",
                      icons: Icons.folder,
                    ),
                  ),
                ],
              )
              : Container(
                width: 250.w,
                height: 250.h,
                // clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Assets.logo),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: AppColors.white),
                  ),
                ),
              ),
          Spacer(),
          WGradientContainer(
            child: Text(
              "Next",
              style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ).paddingAll(24.w),
    );
  }
}
