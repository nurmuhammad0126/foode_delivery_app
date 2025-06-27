import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';

class OrderDetailsWidget extends StatefulWidget {
  final String? subtotal;
  final String? deliveryCharge;
  final String? discount;
  final String? total;
  final VoidCallback? onPlaceOrder;
  final String buttonTitle;

  OrderDetailsWidget({
    super.key,
    this.subtotal,
    this.deliveryCharge,
    this.discount,
    this.total,
    this.onPlaceOrder, required this.buttonTitle,
  });

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [
          10.height,

          _buildPriceRow("Subtotal", widget.subtotal ?? "\$32"),
          15.height,
          _buildPriceRow("Delivery charge", widget.deliveryCharge ?? "\$5"),
          15.height,
          _buildPriceRow("Discount", widget.discount ?? "\$10"),
          8.height,
          Container(height: 1, color: Colors.white.withOpacity(0.3)),
          8.height,

          _buildPriceRow("Total", widget.total ?? "\$27"),
          Spacer(),
          WContainerWithShadow(
            width: MediaQuery.of(context).size.width,
            height: 55.h,
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
            child: Center(
              child: Text(
                widget.buttonTitle,
                style: AppTextStyles.s18w600.copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.s16w400.copyWith(color: AppColors.white),
        ),
        Text(
          price,
          style: AppTextStyles.s20w600.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
