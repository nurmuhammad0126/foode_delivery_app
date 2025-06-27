import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';

class PrimaryIconWidget extends StatelessWidget {
  final icon;
  final double? width;
  final double? height;
  final double? iconSize;
  PrimaryIconWidget({super.key, required this.icon, this.width, this.height, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      height: height ?? 80,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: iconSize ?? 32, color: AppColors.primary),
    );
  }
}
