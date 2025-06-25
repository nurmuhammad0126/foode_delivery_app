import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.backgroundImage, fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.congratsCheck, width: 177.w),
                24.height,
                Text(
                  "Congrats!",
                  style: AppTextStyles.s24w700.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                8.height,
                Text(
                  "Your profile is ready to use",
                  style: AppTextStyles.s14w700.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          ),

          // Go homepage button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: WScaleAnimation(
                onTap: () {},
                child: WGradientContainer(

                  child: Text(
                    "Go homepage",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s18w600.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
