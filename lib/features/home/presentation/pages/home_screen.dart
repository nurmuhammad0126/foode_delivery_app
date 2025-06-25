import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
          ).paddingAll(24.w),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 7, child: WTextField()),
              Expanded(
                flex: 1,
                child: WContainerWithShadow(
                  
                  border: Border.all(color: AppColors.primary100, width: 0),
                  color: AppColors.primary100,
                  child: Icon(Icons.filter_list_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
