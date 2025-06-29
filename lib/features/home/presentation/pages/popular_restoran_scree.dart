import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_screen.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_restoran_details_container.dart';

import '../../../../core/routes/route_names.dart';
import '../widgets/widget_home_search.dart';

class PopularRestoranScreen extends StatefulWidget {
  const PopularRestoranScreen({super.key});

  @override
  State<PopularRestoranScreen> createState() => _PopularRestoranScreenState();
}

class _PopularRestoranScreenState extends State<PopularRestoranScreen> {
  final TextEditingController _searController = TextEditingController();
  final List<RestoranItems> homeDetailsRestorans = [
    ...restaurants,
    ...restaurants,
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          WidgetArrowBackButton(
            text: "Popular Restaurant",
          ).paddingOnly(left: 24.w, right: 24.w, top: 24.w),
          WidgetHomeSearch(
            searchController: _searController,
            onTap: () {
              context.pushNamed(AppRoutesNames.findFood);
            },
          ).paddingSymmetric(horizontal: 24.w, vertical: 32.w),

          GridView.builder(
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

          64.height,
        ],
      ),
    );
  }
}
