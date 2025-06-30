import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class WRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  final VoidCallback? onTapText1;
  final VoidCallback? onTapText2;

  const WRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.textStyle1,
    this.textStyle2,
    this.onTapText1,
    this.onTapText2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style:
                textStyle1 ??
                AppTextStyles.s16w600.copyWith(color: AppColors.darkGray),
            recognizer:
                onTapText1 != null
                    ? (TapGestureRecognizer()..onTap = onTapText1)
                    : null,
          ),
          TextSpan(
            text: text2,
            style:
                textStyle2 ??
                AppTextStyles.s16w600.copyWith(color: AppColors.primary),
            recognizer:
                onTapText2 != null
                    ? (TapGestureRecognizer()..onTap = onTapText2)
                    : null,
          ),
        ],
      ),
    );
  }
}
