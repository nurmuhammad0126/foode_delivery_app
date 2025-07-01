import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_text_field.dart';

class HomeNotificationScreen extends StatefulWidget {
  const HomeNotificationScreen({super.key});

  @override
  State<HomeNotificationScreen> createState() => _HomeNotificationScreenState();
}

class _HomeNotificationScreenState extends State<HomeNotificationScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          64.height,
          WidgetArrowBackButton(text: "Notification"),
          24.height,
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
          for (int i = 0; i < 4; i++)
            WContainerWithShadow(
              border: Border.all(color: AppColors.white),
              color: AppColors.white,
              height: mediaQueryHeight * 0.1,
              child: Row(
                children: [
                  SvgPicture.asset(Assets.congratsCheck),
                  Column(
                    children: [
                      Text(
                        "Your order is completed!",
                        style: AppTextStyles.s18w600,
                      ),

                      Text(
                        "200",
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ).paddingOnly(top: 32.w),
        ],
      ).paddingSymmetric(horizontal: 24.w),
    );
  }
}
