import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class WRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;

  const WRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.textStyle1,
    this.textStyle2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style:
            textStyle1 ??
            AppTextStyles.s16w600.copyWith(color: AppColors.darkGray),
        children: [
          TextSpan(
            text: text2,
            style:
                textStyle2 ??
                AppTextStyles.s16w600.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
