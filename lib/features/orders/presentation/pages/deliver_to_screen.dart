import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/order_detals_widget.dart';

class DeliverToScreen extends StatefulWidget {
  const DeliverToScreen({super.key});

  @override
  State<DeliverToScreen> createState() => _DeliverToScreenState();
}

class _DeliverToScreenState extends State<DeliverToScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            24.height,
            WidgetArrowBackButton(text: "Deliver to"),
            40.height,
            WContainerWithShadow(
              border: Border.all(color: AppColors.primary),
              height: mediaQueryHeight * 0.12,
              borderRadius: BorderRadius.circular(20),

              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: AppColors.primary,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("data", style: AppTextStyles.s18w600),
                      Text(
                        "data",
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            32.height,
            WContainerWithShadow(
              border: Border.all(color: AppColors.white),
              height: mediaQueryHeight * 0.12,
              borderRadius: BorderRadius.circular(20),

              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: AppColors.primary,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("data", style: AppTextStyles.s18w600),
                      Text(
                        "data",
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: WGradientContainer(
          width: mediaQueryWidth,
          height: mediaQueryHeight * 0.3,
          colors: [AppColors.primary, AppColors.primaryLight],
          child: OrderDetailsWidget(buttonTitle: 'Next'),
        ),
      ),
    );
  }
}
