import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_cached_image.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/home/presentation/widgets/widget_home_search.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/my_button_sheet.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/order_detals_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int quantity = 0;

  final TextEditingController _searController = TextEditingController();

  get mediaQueryHeight => null;

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          WidgetArrowBackButton(
            text: "Order details",
          ).paddingOnly(left: 24.w, right: 24.w, top: 24.w),

          WidgetHomeSearch(
            searchController: _searController,
          ).paddingSymmetric(horizontal: 24.w, vertical: 32.w),

          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    myButtonSheeat(context, mediaQueryWidth);
                  },

                  background: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),

                  child: WContainerWithShadow(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        Row(
                          children: [
                            _buildQuantityButton(
                              Icons.remove,
                              () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              AppColors.primary100,
                              AppColors.primary,
                            ),
                            8.width,
                            Text(
                              quantity.toString(),
                              style: AppTextStyles.s16w600,
                            ),
                            8.width,
                            _buildQuantityButton(
                              Icons.add,
                              () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              AppColors.primary,
                              AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 32.w, left: 24.w, right: 24.w),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: WGradientContainer(
          width: mediaQueryWidth,
          height: mediaQueryHeight * 0.3,
          colors: [AppColors.primary, AppColors.primaryLight],
          child: OrderDetailsWidget(buttonTitle: 'Place my order'),
        ),
      ),
    );
  }
}

Widget _buildQuantityButton(
  IconData icon,
  VoidCallback onTap,
  Color color,
  Color iconColor,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: iconColor, size: 18),
    ),
  );
}
