import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/router.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/chat/presentation/widgets/promo_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          WidgetArrowBackButton(text: "Promo"),
          24.height,
          PromoWidget(
            mainContainerColors: [AppColors.primaryLight, AppColors.primary],
            colors: [AppColors.yellow, AppColors.yellow],
            image: Assets.burger,
            title: "Special Deal for December",
          ),
          24.height,
          PromoWidget(
            mainContainerColors: [AppColors.warningLight, AppColors.warning],
            colors: [AppColors.primaryLight, AppColors.primary],
            image: Assets.burger,
            title: "Special Deal for December",
          ),
          24.height,
          PromoWidget(
            mainContainerColors: [
              AppColors.green.withAlpha(100),
              AppColors.green,
            ],
            colors: [AppColors.yellow, AppColors.yellow],
            image: Assets.burger,
            title: "Special Deal for December",
          ),
        ],
      ).paddingAll(24.w),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WScaleAnimation(
        onTap: () {
          context.goToHome();
        },
        child: WGradientContainer(
          child: Text(
            "Checkout",
            style: AppTextStyles.s18w700.copyWith(color: AppColors.white),
          ),
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
