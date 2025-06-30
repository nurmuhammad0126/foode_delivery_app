import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_home_search.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_cached_image.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';
import '../blocs/bloc/home_bloc.dart';
import '../widgets/widget_restoran_details_container.dart';
import 'home_screen.dart';

class FilterFindFoodScreen extends StatefulWidget {
  final bool isMeals;
  final List<String> selected;
  const FilterFindFoodScreen({
    super.key,
    required this.selected,
    required this.isMeals,
  });

  @override
  State<FilterFindFoodScreen> createState() => _FilterFindFoodState();
}

class _FilterFindFoodState extends State<FilterFindFoodScreen> {
  final searchController = TextEditingController();
  final List<RestoranItems> homeDetailsRestorans = [
    ...restaurants,
    ...restaurants,
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          WidgetArrowBackButton(text: "Find your food"),
          WidgetHomeSearch(searchController: searchController, onTap: () {}),

          widget.isMeals
              ? BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.homeStatus == HomeStatus.success) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: state.meals.length,
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
              )
              : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: mediaQueryHeight * 0.22,
                  mainAxisSpacing: 32.w,
                  crossAxisSpacing: 24.w,
                ),
                itemCount: homeDetailsRestorans.length,
                itemBuilder: (context, index) {
                  final restoran = homeDetailsRestorans[index];
                  return WidgetRestoranDetailsContainer(
                    restoranItems: restoran,
                    widthC: mediaQueryWidth * 0.5,
                  );
                },
              ),
        ],
      ),
    );
  }
}
