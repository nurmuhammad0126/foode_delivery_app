import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_gradient_container.dart';

class PromoWidget extends StatelessWidget {
  final List<Color> mainContainerColors;
  final List<Color> colors;
  final String image;
  final String title;

  const PromoWidget({
    super.key,
    required this.mainContainerColors,
    required this.colors,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WGradientContainer(
      colors: mainContainerColors,
      height: mediaQueryHeight * 0.2,
      child: Row(
        children: [
          Expanded(child: Image.asset(image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.s24w600.copyWith(color: AppColors.white),
                ),
                12.height,
                WScaleAnimation(
                  onTap: () {
                    context.pushNamed(AppRoutesNames.orderDetails);
                  },
                  child: WGradientContainer(
                    width: mediaQueryWidth * 0.35,
                    height: mediaQueryHeight * 0.045,
                    colors: colors,
                    child: Text(
                      "Buy Now",
                      style: AppTextStyles.s14w600.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
