import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_restoran_details_container.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/primary_icon_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/row_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/widget_info_user_container.dart';


class RestaurantProfileScreen extends StatefulWidget {
  const RestaurantProfileScreen({super.key});

  @override
  State<RestaurantProfileScreen> createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState extends State<RestaurantProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,

            backgroundColor: AppColors.white,
            context: context,
            builder:
                (context) => FractionallySizedBox(
                  heightFactor: 0.8,
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            'Lovy Food Restaurant',
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
                            'We are one of the best restaurants in the city of Surabaya with years of experience. We serve a lot of quality food cooked directly by professional chefs. Hope you like it!',
                            style: AppTextStyles.s16w400.copyWith(
                              color: AppColors.neutralWhite,
                            ),
                          ),
                          24.height,
                          RowWidget(title: 'Popular Menu'),
                          24.height,
                          SizedBox(
                            height: mediaQueryHeight * 0.25,
                            child: ListView.builder(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemCount: restaurants.length,
                              itemBuilder: (context, index) {
                                final restoran = restaurants[index];
                                return WidgetRestoranDetailsContainer(
                                  margin: EdgeInsets.only(right: 24.w),
                                  restoranItems: restoran,
                                  widthC: mediaQueryWidth * 0.4,
                                );
                              },
                            ),
                          ),
                          24.height,
                          RowWidget(title: 'Testimonials'),
                          24.height,
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
                          WScaleAnimation(
                            onTap: () {},
                            child: WContainerWithShadow(
                              padding: EdgeInsets.symmetric(vertical: 14.w),
                              shadow: [],
                              border: Border.all(
                                color: AppColors.primary,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.white,
                              child: Row(
                                spacing: 8.w,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColors.primary,
                                  ),
                                  Text(
                                    "Back",
                                    style: AppTextStyles.s18w600.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          24.height,
                        ],
                      ).paddingSymmetric(horizontal: 24.w),
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}

final List<RestoranItems> restaurants = [
  RestoranItems(
    name: "Lovy Food",
    iconAsset: Assets.lovyFoodIcon,
    time: "15 minut",
  ),
  RestoranItems(
    name: "Cloudy Resto",
    iconAsset: Assets.cloudyRestoIcon,
    time: "20 minut",
  ),
  RestoranItems(
    name: "Circlo Resto",
    iconAsset: Assets.circoRestoIcon,
    time: "10 minut",
  ),
  RestoranItems(
    name: "Haty Food",
    iconAsset: Assets.heartyRestoIcon,
    time: "12 minut",
  ),
  RestoranItems(
    name: "Recto Food",
    iconAsset: Assets.ractoFoodIcon,
    time: "18 minut",
  ),
];
