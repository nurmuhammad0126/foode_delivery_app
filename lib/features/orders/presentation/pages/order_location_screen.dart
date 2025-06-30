import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/primary_icon_widget.dart';

class OrderLocationScreen extends StatefulWidget {
  const OrderLocationScreen({super.key});

  get searchController => null;

  @override
  State<OrderLocationScreen> createState() => _OrderLocationScreenState();
}

class _OrderLocationScreenState extends State<OrderLocationScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    // final mediaQueryWidth = MediaQuery.of(context).size.width;
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: WTextField(
              controller: searchController,
              fillColor: AppColors.background,
              hasBorderColor: false,
              border: Border.all(color: AppColors.background),
              borderColor: AppColors.background,
              hintText: "Find your location",
              hintTextStyle: AppTextStyles.s14w400.copyWith(
                color: AppColors.neutralBlack,
              ),
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 26.w,
                vertical: 9,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: WContainerWithShadow(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
          padding: EdgeInsets.zero,
          height: mediaQueryHeight * 0.22,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                WContainerWithShadow(
                  padding: EdgeInsets.zero,
                  border: Border.all(color: AppColors.primary),
                  height: mediaQueryHeight * 0.1,
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            PrimaryIconWidget(icon: Icons.location_on),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("data", style: AppTextStyles.s18w600),
                                Text(
                                  "data",
                                  style: AppTextStyles.s14w400.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        WContainerWithShadow(
                          border: Border.all(color: AppColors.primary),
                          width: 30.w,
                          height: 30.h,
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                          child: Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                WScaleAnimation(
                  onTap: () {},
                  child: WGradientContainer(
                    padding: EdgeInsets.zero,
                    colors: [AppColors.primary, AppColors.primaryLight],

                    child: Text(
                      "Set location",
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
      ),
    );
  }
}
