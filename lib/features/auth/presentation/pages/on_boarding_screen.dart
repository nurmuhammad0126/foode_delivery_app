import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/routes/router.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/extensions/num_extensions.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBaoardibngScreenState();
}

class _OnBaoardibngScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(child: Image.asset(Assets.splash, fit: BoxFit.cover)),

          // Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Foode',
                    style: AppTextStyles.s10w800.copyWith(
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  16.height,
                  Text(
                    'The best food ordering and delivery app of the century',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s16w400.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  50.height,
                  WScaleAnimation(
                    onTap: () {
                      context.goToLogin();
                    },
                    child: WGradientContainer(
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s18w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
