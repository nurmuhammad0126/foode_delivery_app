import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_home_search.dart';

import '../widgets/widget_restoran_details_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.height,

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
                WContainerWithShadow(
                  border: Border.all(color: AppColors.gray50),
                  color: AppColors.gray50,
                  padding: EdgeInsets.all(10.w),
                  child: Icon(
                    Icons.notifications_active_rounded,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ).paddingOnly(left: 24.w, right: 24.w, top: 24.w),
            WidgetHomeSearch(searchController: _searController)
              ..paddingSymmetric(horizontal: 24.w, vertical: 32.w),
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
            ).paddingSymmetric(horizontal: 24.w),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular RestoranItems", style: AppTextStyles.s20w600),
                Text(
                  "See all",
                  style: AppTextStyles.s16w600.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 18.w, vertical: 32.w),
            SizedBox(
              height: mediaQueryHeight * 0.23,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restoran = restaurants[index];
                  return WidgetRestoranDetailsContainer(
                    restoranItems: restoran,
                    margin: EdgeInsets.only(left: 24.w),
                    widthC: mediaQueryWidth * 0.4,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Menu", style: AppTextStyles.s20w600),
                Text(
                  "See all",
                  style: AppTextStyles.s16w600.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 18.w, vertical: 32.w),
          ],
        ),
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
