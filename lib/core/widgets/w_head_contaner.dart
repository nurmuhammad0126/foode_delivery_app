import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

class WHeadContaner extends StatefulWidget {
  final Image? image;
  final String? title;
  final String? subtitle;
  final int? count;
  final Widget? trailingWidget;
  final bool showtrailingWidget;
  final Color? color;
  final double? borderRadius;
  final double? width;
  final double? height;
  WHeadContaner({
    super.key,
    this.image,
    this.title,
    this.subtitle,
    this.count,
    this.trailingWidget,
    this.showtrailingWidget = false, this.color, this.borderRadius, this.width, this.height,
  });

  @override
  State<WHeadContaner> createState() => _WHeadContanerState();
}

class _WHeadContanerState extends State<WHeadContaner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 380.w,
      height: widget.height ?? 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 16)
      ),

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
                  child: widget.image,
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.title ?? '',
                    style: AppTextStyles.s18w600.copyWith(
                      color: AppColors.neutralBlack,
                    ),
                  ),
                  Text(
                    widget.subtitle ?? '',
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.neutralWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(children: [
            if(widget.showtrailingWidget == true) ...{
              widget.trailingWidget!,
            }
            ],
          ),
        ],
      ),
    );
  }
}
