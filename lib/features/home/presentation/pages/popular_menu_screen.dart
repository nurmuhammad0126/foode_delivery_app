import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_cached_image.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

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
          ).paddingSymmetric(horizontal: 24.w, vertical: 32.w),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return WContainerWithShadow(
                border: Border.all(color: AppColors.white),
                height: mediaQueryHeight * 0.1,

                color: AppColors.white,
                child: Row(
                  children: [
                    WCachedImage(
                      borderRadius: BorderRadius.circular(14),
                      width: mediaQueryWidth * 0.2,
                      imageUrl:
                          "https://images.ctfassets.net/0tc4847zqy12/1srWoukcEfZ0fjWpSn0ppM/61e0572e4d73e43093efe7e77cfb43c3/F25_HabaneroLimeSteak_QDOBA-Mexican-Eats_MenuPage.png?w=800&q=25",
                    ),
                    20.width,
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
              ).paddingOnly(bottom: 32.w, left: 24.w, right: 24.w);
            },
          ),
        ],
      ),
    );
  }
}
