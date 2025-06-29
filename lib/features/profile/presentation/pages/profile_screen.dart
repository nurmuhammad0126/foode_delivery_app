import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_cached_image.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/primary_icon_widget.dart';
import 'package:task_for_uicgroup/features/orders/presentation/widgets/row_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final mediaQueryHeight = MediaQuery.of(context).size.height;
    // final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.personImage,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.56,
            minChildSize: 0.56,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.height,
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      16.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WContainerWithShadow(
                            padding: EdgeInsets.zero,
                            width: 120.w,
                            height: 25.h,
                            border: Border.all(color: AppColors.yellow),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                            child: Center(
                              child: Text(
                                'Member Gold',
                                style: AppTextStyles.s14w400.copyWith(
                                  color: AppColors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      30.height,
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daniel Sebastian',
                                style: AppTextStyles.s24w600.copyWith(
                                  fontSize: 23,
                                  color: AppColors.neutralBlack,
                                  fontFamily: '',
                                ),
                              ),

                              Text(
                                "daniel.sebastian@yourdomain.com",
                                style: AppTextStyles.s16w400.copyWith(
                                  fontFamily: '',
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          PrimaryIconWidget(
                            icon: Icons.edit,
                            height: 38.h,
                            width: 38.w,
                            iconSize: 17.h,
                          ),
                        ],
                      ),

                      WContainerWithShadow(
                        border: Border.all(color: AppColors.white),
                        color: AppColors.white,
                        height: 67.h,
                        width: 380.w,
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.congratsDollar),

                            Text(
                              "You have 4 vouchers",
                              style: AppTextStyles.s18w600,
                            ),
                          ],
                        ),
                      ).paddingOnly(top: 32.w),

                      24.height,
                      RowWidget(
                        title: 'Favorite',
                        onTap: () {
                          context.pushNamed(AppRoutesNames.favorites);
                        },
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder:
                            (context, index) => WContainerWithShadow(
                              border: Border.all(color: AppColors.white),
                              height: 99.h,
                              width: 380.w,

                              color: AppColors.white,
                              child: Row(
                                children: [
                                  WCachedImage(
                                    borderRadius: BorderRadius.circular(14),
                                    width: 75.h,
                                    height: 75.h,
                                    imageUrl:
                                        "https://images.ctfassets.net/0tc4847zqy12/1srWoukcEfZ0fjWpSn0ppM/61e0572e4d73e43093efe7e77cfb43c3/F25_HabaneroLimeSteak_QDOBA-Mexican-Eats_MenuPage.png?w=800&q=25",
                                  ),
                                  20.width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "data",
                                        style: AppTextStyles.s18w600,
                                      ),
                                      Text(
                                        "Lovy Food",
                                        style: AppTextStyles.s14w400.copyWith(
                                          color: AppColors.gray,
                                        ),
                                      ),
                                      Text(
                                        "\$12",
                                        style: AppTextStyles.s16w600.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 32.o,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ).paddingOnly(bottom: 24.h),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24.w),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
