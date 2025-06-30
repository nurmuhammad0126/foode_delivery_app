import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

class MyArrowBackWidget extends StatelessWidget {
  const MyArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.w),
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: AppColors.white.withOpacity(0.3),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 19.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
