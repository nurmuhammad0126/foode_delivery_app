import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';
import '../widgets/widget_custom_chip.dart';
import '../widgets/widget_home_search.dart';

class FindFoodScreen extends StatefulWidget {
  const FindFoodScreen({super.key});

  @override
  State<FindFoodScreen> createState() => _FindFoodScreenState();
}

class _FindFoodScreenState extends State<FindFoodScreen> {
  final TextEditingController _searController = TextEditingController();
  final List<String> typeList = ['Restaurant', 'Menu'];
  final List<String> locationList = ['1 km', '<5 km', '<10 km', '>10 km'];
  final List<String> foodList = [
    'Cake',
    'Salad',
    'Pasta',
    'Dessert',
    'Main course',
    'Appetizer',
    'Soup',
  ];
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetArrowBackButton(
            text: "Find your food",
          ).paddingOnly(left: 24.w, right: 24.w, top: 24.w),
          WidgetHomeSearch(
            searchController: _searController,
          ).paddingSymmetric(vertical: 32.w),

          Text("Type", style: AppTextStyles.s20w600),
          20.height,
          Wrap(
            children: [
              for (var i in typeList)
                WidgetCustomChip(isSelected: false, text: i, onTap: () {}),
            ],
          ),
          32.height,
          Text("Location", style: AppTextStyles.s20w600),
          20.height,
          Wrap(
            children: [
              for (var i in locationList)
                WidgetCustomChip(isSelected: false, text: i, onTap: () {}),
            ],
          ),

          32.height,
          Text("Food", style: AppTextStyles.s20w600),
          20.height,
          Wrap(
            children: [
              for (var i in foodList)
                WidgetCustomChip(isSelected: false, text: i, onTap: () {}),
            ],
          ),

          Spacer(),
          WScaleAnimation(
            onTap: () {},
            child: WGradientContainer(
              colors:
                  selected.isEmpty
                      ? const [AppColors.primary500, AppColors.primary500]
                      : const [Color(0xFFFF7E95), Color(0xFFFF1843)],
              child: Text(
                "Search",
                style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
              ),
            ),
          ),
          24.height,
        ],
      ).paddingSymmetric(horizontal: 24.w),
    );
  }
}
