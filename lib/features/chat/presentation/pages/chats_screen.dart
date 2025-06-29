import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';

import '../../../../core/widgets/w_text_field.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            30.height,
            Row(
              spacing: 24.w,
              children: [
                SizedBox(
                  width: 36.w,
                  height: 36.h,
                  child: WGradientContainer(
                    child: SvgPicture.asset(Assets.bellIcons),
                  ),
                ),
                Text(
                  'Chat',
                  style: AppTextStyles.s20w600.copyWith(fontSize: 26),
                ),
              ],
            ),
            32.height,
            // search
            WTextField(
              controller: TextEditingController(),
              fillColor: AppColors.background,
              hasBorderColor: false,
              border: Border.all(color: AppColors.background),
              borderColor: AppColors.background,
              hintText: "Search",
              hintTextStyle: AppTextStyles.s14w400,
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 26.w,
                vertical: 9,
              ),
            ),
            Expanded(
              child: ListView.separated(
                clipBehavior: Clip.none,
                itemCount: 10,

                itemBuilder: (context, index) {
                  return WScaleAnimation(
                    onTap: () {
                      context.pushNamed(AppRoutesNames.chat);
                    },
                    child: WContainerWithShadow(
                      padding: EdgeInsets.all(12),
                      border: Border.all(color: Colors.white),
                      width: MediaQuery.of(context).size.width,
                      height: 90.h,
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 20.w,
                            children: [
                              SizedBox(
                                width: 64.w,
                                height: 64.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(Assets.personImage1),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Guy Hawkins',
                                    style: AppTextStyles.s18w600.copyWith(
                                      color: AppColors.neutralBlack,
                                    ),
                                  ),
                                  Text(
                                    "I'll be there in 2 mins",
                                    style: AppTextStyles.s14w400.copyWith(
                                      color: AppColors.neutralWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WContainerWithShadow(
                                    width: 25.w,
                                    height: 25.h,
                                    border: Border.all(
                                      color: AppColors.primary,
                                    ),
                                    padding: EdgeInsets.zero,
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.redPrimary100,
                                    child: Center(
                                      child: Text(
                                        '3',
                                        style: AppTextStyles.s14w600.copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '20.00',
                                    style: AppTextStyles.s16w400.copyWith(
                                      color: AppColors.neutralWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 32.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
