import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/primary_icon_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/row_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/widget_info_user_container.dart';

class MenuDetailsScreen extends StatefulWidget {
  const MenuDetailsScreen({super.key});

  @override
  State<MenuDetailsScreen> createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WScaleAnimation(
        child: WGradientContainer(
          child: Text(
            "Add to cart",
            style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
          ),
        ),
        onTap: () {},
      ).paddingSymmetric(horizontal: 24.w),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/i.png",
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.height,
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      16.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WContainerWithShadow(
                            padding: EdgeInsets.zero,
                            width: 80.w,
                            height: 25.h,
                            border: Border.all(color: AppColors.green),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                            child: Center(
                              child: Text(
                                'Popular',
                                style: AppTextStyles.s14w400.copyWith(
                                  color: AppColors.green,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              PrimaryIconWidget(
                                width: 40,
                                height: 40,
                                iconSize: 17,
                                icon: Icons.location_on,
                              ),
                              PrimaryIconWidget(
                                width: 40,
                                height: 40,
                                iconSize: 17,
                                icon: Icons.favorite_border,
                              ),
                            ],
                          ),
                        ],
                      ),
                      30.height,
                      Text(
                        'Original Salad',
                        style: AppTextStyles.s24w600.copyWith(
                          fontSize: 23,
                          color: AppColors.neutralBlack,
                        ),
                      ),
                      10.height,
                      Row(
                        children: [
                          PrimaryIconWidget(
                            width: 40,
                            height: 40,
                            iconSize: 17,
                            icon: Icons.location_on,
                          ),
                          5.width,
                          Text(
                            '3 km',
                            style: AppTextStyles.s14w400.copyWith(
                              color: AppColors.neutralBlack,
                            ),
                          ),
                          20.width,
                          PrimaryIconWidget(
                            width: 40,
                            height: 40,
                            iconSize: 17,
                            icon: Icons.star_half_outlined,
                          ),
                          Text(
                            '4.8 rating',
                            style: AppTextStyles.s14w400.copyWith(
                              color: AppColors.neutralBlack,
                            ),
                          ),
                        ],
                      ),
                      10.height,
                      Text(
                        """Yummie and lexat original salad made directly by our professional chef. Consists of a variety of selected quality vegetables and fruits:
• Kale
• Spinach
• Melon
• Strawberry
• Lettuce
• Cucumber
Served warmly for you. We also have extra seasoning for you to enjoy. Hope you like it!""",
                        style: AppTextStyles.s16w400.copyWith(
                          color: AppColors.neutralWhite,
                        ),
                      ),

                      24.height,
                      RowWidget(title: 'Testimonials'),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder:
                            (context, index) => WidgetInfoUserContainer(
                              mediaQueryHeight: mediaQueryHeight,
                              mediaQueryWidth: mediaQueryWidth,
                              image: Assets.person,
                              title1: "Jenny Wilson",
                              title3:
                                  "The food is very delicious and the service is satisfying! Love it!",
                              title2: "December 20, 2021",
                            ),
                      ),
                      24.height,
                    ],
                  ).paddingSymmetric(horizontal: 24.w),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
