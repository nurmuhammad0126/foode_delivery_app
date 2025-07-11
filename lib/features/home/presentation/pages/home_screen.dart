import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_home_search.dart';

import '../../../../core/widgets/w_cached_image.dart';
import '../blocs/bloc/home_bloc.dart';
import '../widgets/widget_restoran_details_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetMealsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 32.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            24.height,
            Row(
              children: [
                WGradientContainer(
                  width: 34.w,
                  height: 34.h,
                  child: SvgPicture.asset(Assets.bellIcons),
                ),
                24.width,
                Text("Hello, Daniel !", style: AppTextStyles.s24w600),
                Spacer(),
                WScaleAnimation(
                  onTap: () {
                    context.pushNamed(AppRoutesNames.notification);
                  },
                  child: WContainerWithShadow(
                    border: Border.all(color: AppColors.gray50),
                    color: AppColors.gray50,
                    padding: EdgeInsets.all(10.w),
                    child: Icon(
                      Icons.notifications_active_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            WidgetHomeSearch(searchController: _searController, onTap: () {}),
            WGradientContainer(
              height: mediaQueryHeight * 0.2,
              child: Row(
                children: [
                  Expanded(child: Image.asset(Assets.burger)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Special Deal for December",
                          style: AppTextStyles.s24w600.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        12.height,
                        WGradientContainer(
                          width: mediaQueryWidth * 0.35,
                          height: mediaQueryHeight * 0.045,
                          colors: [AppColors.yellow, AppColors.yellow],
                          child: Text(
                            "Buy Now",
                            style: AppTextStyles.s14w600.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Restoran", style: AppTextStyles.s20w600),
                WScaleAnimation(
                  onTap: () {
                    context.pushNamed(AppRoutesNames.popularRestaurant);
                  },
                  child: Text(
                    "See all",
                    style: AppTextStyles.s16w600.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mediaQueryHeight * 0.23,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length~/2,
                itemBuilder: (context, index) {
                  final restoran = restaurants[index];
                  return WidgetRestoranDetailsContainer(
                    restoranItems: restoran,
                    margin: EdgeInsets.only(right: 24.w),
                    widthC: mediaQueryWidth * 0.4,
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Menu", style: AppTextStyles.s20w600),
                WScaleAnimation(
                  onTap: () {
                    context.pushNamed(AppRoutesNames.popularMenu);
                  },
                  child: Text(
                    "See all",
                    style: AppTextStyles.s16w600.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),

            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.homeStatus == HomeStatus.success) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemCount: state.meals.length~/2,
                    itemBuilder: (context, index) {
                      final meal = state.meals[index];
                      return WContainerWithShadow(
                        border: Border.all(color: AppColors.white),
                        height: mediaQueryHeight * 0.1,
                        margin: EdgeInsets.only(bottom: 24.w),
                        color: AppColors.white,
                        child: Row(
                          children: [
                            WCachedImage(
                              borderRadius: BorderRadius.circular(14),
                              width: mediaQueryWidth * 0.2,
                              imageUrl: meal.image ?? "",
                            ),
                            20.width,
                            SizedBox(
                              width: mediaQueryWidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    meal.name ?? "",
                                    style: AppTextStyles.s18w600,
                                  ),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                    meal.description ?? "",
                                    style: AppTextStyles.s14w400.copyWith(
                                      color: AppColors.gray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              "\$77",
                              style: AppTextStyles.s10w600.copyWith(
                                color: AppColors.primary,
                                fontSize: 28.o,
                              ),
                            ).paddingOnly(right: 12.w),
                          ],
                        ),
                      );
                    },
                  );
                }
                if (state.homeStatus == HomeStatus.loading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                if (state.homeStatus == HomeStatus.error) {
                  log(state.errorMessage);
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.s26w400,
                    ),
                  );
                }
                return SizedBox(
                  child: Text(
                    "Hozircha bizda mahsulotlar yoq !!!",
                    style: AppTextStyles.s22w800.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),
            60.height,
          ],
        ).paddingSymmetric(horizontal: 24.w),
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

class RestoranItems {
  final String name;
  final String iconAsset;
  final String time;

  RestoranItems({
    required this.name,
    required this.iconAsset,
    required this.time,
  });
}
