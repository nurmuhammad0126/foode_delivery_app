import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';

class OrderStatus extends StatelessWidget {
  final String status;

  const OrderStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    String text = status;

    switch (status.toLowerCase()) {
      case 'proccess':
        bgColor = AppColors.statusSuccess;
        break;
      case 'completed':
        bgColor = AppColors.statusInfo;
        break;
      case 'canceled':
        bgColor = AppColors.statusError;
        break;
      default:
        bgColor = Colors.grey;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
