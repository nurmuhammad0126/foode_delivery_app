import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_cached_image.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

import '../blocs/bloc/home_bloc.dart';
import '../widgets/widget_home_search.dart';

class PopularMenuScreen extends StatefulWidget {
  const PopularMenuScreen({super.key});

  @override
  State<PopularMenuScreen> createState() => _PopularMenuScreenState();
}

class _PopularMenuScreenState extends State<PopularMenuScreen> {
  final TextEditingController _searController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          WidgetArrowBackButton(
            text: "Popular Menu",
          ).paddingOnly(left: 24.w, right: 24.w, top: 24.w),

          WidgetHomeSearch(
            searchController: _searController,
            onTap: () {
              context.pushNamed(AppRoutesNames.findFood,extra: true);
            },
          ).paddingSymmetric(horizontal: 24.w, vertical: 32.w),

          BlocBuilder<HomeBloc, HomeState>(
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
                  child: Text(state.errorMessage, style: AppTextStyles.s26w400),
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
        ],
      ),
    );
  }
}
