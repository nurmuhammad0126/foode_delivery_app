import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/features/chat/presentation/widgets/my_arrow_back_widget.dart';
import 'package:task_for_uicgroup/features/chat/presentation/widgets/rating_widget.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                20.height,
                MyArrowBackWidget(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WContainerWithShadow(
                        border: Border(),
                        borderRadius: BorderRadius.circular(25),
                        width: 200.w,
                        height: 200.h,
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.restaurantIcon),
                            24.height,
                            Text(
                              'Recto Food',
                              style: AppTextStyles.s18w600.copyWith(),
                            ),
                          ],
                        ),
                      ),
                      32.height,
                      Text(
                        "Thank you!",
                        style: AppTextStyles.s26w800.copyWith(
                          fontSize: 32,
                          color: AppColors.primary,
                        ),
                      ),

                      108.height,
                      Text(
                        "Please rate the restaurant",
                        style: AppTextStyles.s16w400.copyWith(
                          color: AppColors.neutralWhite,
                        ),
                      ),
                      24.height,
                      StarRating(rating: 4, size: 33),
                    ],
                  ),
                ),
                Column(
                  children: [
                    WContainerWithShadow(
                      height: 70.h,
                      borderRadius: BorderRadius.circular(20),
                      border: Border(),
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                            color: AppColors.primary,
                            size: 32,
                          ),
                          hintText: 'Leave feedback',
                          hintStyle: AppTextStyles.s16w400.copyWith(
                            color: AppColors.neutralWhite,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    24.height,
                    WScaleAnimation(
                      onTap: () {},
                      child: WGradientContainer(
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s18w600.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    20.height,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
