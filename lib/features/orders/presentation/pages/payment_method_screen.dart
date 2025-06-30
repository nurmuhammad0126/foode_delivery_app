import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/order_detals_widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
            WidgetArrowBackButton(text: "Payment method"),
            32.height,
            Column(
              spacing: 30,
              children: [
                WContainerWithShadow(
                  border: Border.all(color: AppColors.primary, width: 2.w),
                  height: mediaQueryHeight * 0.1,
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(Assets.payPalLogo),
                        Text(
                          '+6282******39',
                          style: AppTextStyles.s24w400.copyWith(
                            color: AppColors.neutralBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                WContainerWithShadow(
                  border: Border.all(color: AppColors.white),
                  height: mediaQueryHeight * 0.11,
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(Assets.visaLogo),
                        Text(
                          '+6282******39',
                          style: AppTextStyles.s24w400.copyWith(
                            color: AppColors.neutralBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                WContainerWithShadow(
                  border: Border.all(color: AppColors.white),
                  height: mediaQueryHeight * 0.1,
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(Assets.payoneerLogo),
                        Text(
                          '+6282******39',
                          style: AppTextStyles.s24w400.copyWith(
                            color: AppColors.neutralBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: WGradientContainer(
          width: mediaQueryWidth,
          height: mediaQueryHeight * 0.3,
          child: OrderDetailsWidget(
            buttonTitle: 'Next',
            onTap: () {
              context.pushNamed(AppRoutesNames.restaurantProfile);
            },
          ),
        ),
      ),
    );
  }
}
