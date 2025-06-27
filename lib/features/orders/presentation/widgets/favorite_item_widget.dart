import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_cached_image.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return WContainerWithShadow(
      border: Border.all(color: AppColors.white),
      height: mediaQueryHeight * 0.1,

      color: AppColors.white,
      child: Row(
        children: [
          WCachedImage(
            borderRadius: BorderRadius.circular(14),
            width: mediaQueryWidth * 0.2,
            imageUrl:
                "https://images.ctfassets.net/0tc4847zqy12/1srWoukcEfZ0fjWpSn0ppM/61e0572e4d73e43093efe7e77cfb43c3/F25_HabaneroLimeSteak_QDOBA-Mexican-Eats_MenuPage.png?w=800&q=25",
          ),
          20.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("data", style: AppTextStyles.s18w600),
              Text(
                "data",
                style: AppTextStyles.s14w400.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.favorite, color: AppColors.primary, size: 28.w),
        ],
      ),
    ).paddingOnly(bottom: 32.w);
  }
}
