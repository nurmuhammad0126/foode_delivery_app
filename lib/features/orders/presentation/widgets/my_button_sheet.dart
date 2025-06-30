import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';

void myButtonSheeat(BuildContext context, double mediaQueryWidth) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppColors.white,
            width: double.infinity,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 3.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
                40.height,
                Icon(
                  Icons.delete_outline_outlined,
                  color: AppColors.primary,
                  size: 50,
                ),
                15.height,
                Text(
                  'Are you sure you want to delete this menu?',
                  style: AppTextStyles.s16w600.copyWith(
                    color: AppColors.neutralBlack,
                  ),
                ),
                40.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: WContainerWithShadow(
                        padding: EdgeInsets.zero,
                        width: mediaQueryWidth * 0.45,
                        height: 55.h,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.7,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.white,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.s18w600.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    WContainerWithShadow(
                      padding: EdgeInsets.zero,
                      width: mediaQueryWidth * 0.45,
                      height: 55.h,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primary,
                      child: Center(
                        child: Text(
                          'Yes, delete',
                          style: AppTextStyles.s18w600.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
