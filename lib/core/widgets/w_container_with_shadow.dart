import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

class WContainerWithShadow extends StatelessWidget {
  final Widget child;
  final Color color;
  final BorderRadius? borderRadius;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BoxShape? shape;
  final List<BoxShadow>? shadow;
  final Clip clipBehavior;

  const WContainerWithShadow({
    super.key,
    required this.color,
    required this.child,
    this.borderRadius,
    this.border,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.shape,
    this.shadow,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(16.w),
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(12.w),
        border: border ?? Border.all(color: AppColors.gray100, width: 1.o),
        boxShadow:
            shadow ??
            [
              BoxShadow(
                blurRadius: 60,
                spreadRadius: 5,
                offset: Offset(12, 30),
                color: AppColors.shadowBlue,
              ),
            ],
      ),
      child: child,
    );
  }
}
