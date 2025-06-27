import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/widgets/w_container_with_shadow.dart';
import '../../../../core/widgets/w_text_field.dart';

class WidgetHomeSearch extends StatefulWidget {
  final TextEditingController searchController;
  const WidgetHomeSearch({super.key, required this.searchController});

  @override
  State<WidgetHomeSearch> createState() => _WidgetHomeSearchState();
}

class _WidgetHomeSearchState extends State<WidgetHomeSearch> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 7,
          child: 
          WTextField(
            controller: widget.searchController,
            fillColor: AppColors.background,
            hasBorderColor: false,
            border: Border.all(color: AppColors.background),
            borderColor: AppColors.background,
            hintText: "Search",
            hintTextStyle: AppTextStyles.s14w400,
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 9),
          ),
        ),
        20.width,
        Expanded(
          flex: 1,
          child: WContainerWithShadow(
            height: mediaQueryHeight * 0.05,
            padding: EdgeInsets.zero,
            border: Border.all(color: AppColors.primary100, width: 0),
            color: AppColors.primary100,
            child: Icon(Icons.filter_list_rounded, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
