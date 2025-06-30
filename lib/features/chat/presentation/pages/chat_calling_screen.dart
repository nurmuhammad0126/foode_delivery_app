import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

class ChatCallingScreen extends StatefulWidget {
  const ChatCallingScreen({super.key});

  @override
  State<ChatCallingScreen> createState() => _ChatCallingScreenState();
}

class _ChatCallingScreenState extends State<ChatCallingScreen> {
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
                Image.asset(Assets.person, width: 160.w, height: 160.h),
                24.height,
                Text(
                  "Guy Hawkins",
                  style: AppTextStyles.s24w700.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                8.height,
                Text(
                  "Ringing ...",
                  style: AppTextStyles.s14w700.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          ),

          // Go homepage button
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 25.w,
        children: [
          WScaleAnimation(
            onTap: () {
              context.pushNamed(AppRoutesNames.driverRating);
            },
            child: WContainerWithShadow(
              border: Border(),
              padding: EdgeInsets.zero,
              width: 70.w,
              height: 70.h,
              borderRadius: BorderRadius.circular(100),
              color: AppColors.primary100,
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                ),
              ),
            ),
          ),
          WContainerWithShadow(
            border: Border(),
            width: 70.w,
            height: 70.h,
            borderRadius: BorderRadius.circular(100),
            color: AppColors.successBg,
            child: Center(
              child: Icon(Icons.call, color: AppColors.successLight),
            ),
          ),
        ],
      ),
    );
  }
}
