import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_restoran_details_container.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/primary_icon_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/row_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/widget_info_user_container.dart';

class RestaurantProfileScreen extends StatelessWidget {
  const RestaurantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// 🔺 Background image
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

          /// ⬆️ Draggable scrollable content
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
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

                      /// Header Row: Badge + Icons
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

                      /// Title
                      Text(
                        'Lovy Food Restaurant',
                        style: AppTextStyles.s24w600.copyWith(
                          fontSize: 23,
                          color: AppColors.neutralBlack,
                        ),
                      ),
                      10.height,

                      /// Info Row: Distance + Rating
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

                      RowWidget(
                        title: 'Popular Menu',
                        onTap: () {
                          context.pushNamed(AppRoutesNames.popularMenu);
                        },
                      ),
                      16.height,
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

                      /// Testimonials
                      RowWidget(
                        title: 'Testimonials',
                        onTap: () {
                          context.pushNamed(AppRoutesNames.testimonials);
                        },
                      ),
                      16.height,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder:
                            (context, index) => WidgetInfoUserContainer(
                              mediaQueryHeight: mediaQueryHeight,
                              mediaQueryWidth: mediaQueryWidth,
                              image: Assets.person,
                              title1: "Jenny Wilson",
                              title2: "December 20, 2021",
                              title3:
                                  "The food is very delicious and the service is satisfying! Love it!",
                            ),
                      ),
                      100.height,
                    ],
                  ),
                ),
              );
            },
          ),
        ],
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
