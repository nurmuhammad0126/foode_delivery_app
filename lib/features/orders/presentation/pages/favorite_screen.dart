import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_text_field.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';
import '../widgets/favorite_item_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        clipBehavior: Clip.none,
        children: [
          WidgetArrowBackButton(text: "Favorite"),
          36.height,
          WTextField(
            controller: searchController,
            fillColor: AppColors.background,
            hasBorderColor: false,
            border: Border.all(color: AppColors.background),
            borderColor: AppColors.background,
            hintText: "Search",
            hintTextStyle: AppTextStyles.s14w400,
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 9),
          ),
          32.height,
          ListView.builder(
            clipBehavior: Clip.none,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder:
                (context, index) => WScaleAnimation(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      backgroundColor: AppColors.white,
                      builder:
                          (context) => SizedBox(
                            height: mediaQueryHeight * 0.26,
                            width: mediaQueryWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_border_sharp,
                                  size: 50,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  "Remove from favorite?",
                                  style: AppTextStyles.s16w600,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: WScaleAnimation(
                                        child: WContainerWithShadow(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),

                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primary,
                                            width: 2,
                                          ),
                                          color: AppColors.white,
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: AppTextStyles.s18w600
                                                  .copyWith(
                                                    color: AppColors.primary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    12.width,
                                    Expanded(
                                      child: WScaleAnimation(
                                        child: WContainerWithShadow(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primary,
                                            width: 1.5,
                                          ),
                                          color: AppColors.primary,
                                          child: Center(
                                            child: Text(
                                              "Yes, remove",
                                              style: AppTextStyles.s18w600
                                                  .copyWith(
                                                    color: AppColors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 24.w),
                          ),
                    );
                  },
                  child: FavoriteItemWidget(),
                ),
          ),
        ],
      ).paddingSymmetric(horizontal: 24.w),
    );
  }
}
