import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_cached_image.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_home_search.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/order_status_widget.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final TextEditingController _searController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            24.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WGradientContainer(
                  width: 34.w,
                  height: 34.h,
                  child: SvgPicture.asset(Assets.bellIcons),
                ),
                24.width,
                Text("Order History", style: AppTextStyles.s24w600),
              ],
            ),
            WidgetHomeSearch(searchController: _searController),
            32.height,

            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return WContainerWithShadow(
                  border: Border.all(color: AppColors.white),
                  height: mediaQueryHeight * 0.1,

                  color: AppColors.white,
                  child: Row(
                    children: [
                      WCachedImage(
                        borderRadius: BorderRadius.circular(14),
                        width: mediaQueryWidth * 0.2,
                        imageUrl:
                            "https://images.ctfassets.net/0tc4847zqy12/1srWoukcEfZ0fjWpSn0ppM/61e0572e4d73e43093efe7e77cfb43c3/F25_HabaneroLimeSteak_QDOBA-Mexican-Eats_MenuPage.png?w=800&q=25",
                      ),
                      20.width,
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
                      Spacer(),
                      OrderStatus(status: 'Proccess'),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
