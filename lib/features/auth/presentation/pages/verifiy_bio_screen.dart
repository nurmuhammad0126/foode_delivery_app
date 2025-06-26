import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/widgets/w_gradient_container.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';

class VerifiyBioScreen extends StatefulWidget {
  const VerifiyBioScreen({super.key});

  @override
  State<VerifiyBioScreen> createState() => _VerifiyBioScreenState();
}

class _VerifiyBioScreenState extends State<VerifiyBioScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            WidgetArrowBackButton(text: "Fill in your bio"),
            24.height,
            Text(
              "This data will be displayed in your account profile for security",
              style: AppTextStyles.s16w400,
            ),
            35.height,

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WRichText(
                    text1: "Full Name",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    controller: _fullNameController,
                    hintText: "Full Name",
                  ),
                  20.height,
                  WRichText(
                    text1: "Nick Name",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,

                  WTextField(
                    controller: _nickNameController,
                    hintText: "Nick Name",
                  ),
                  20.height,

                  WRichText(
                    text1: "Phone Number",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,

                  WTextField(
                    autoFocus: true,
                    controller: _phoneNumberController,
                    hintText: "Phone Number",
                  ),
                  20.height,

                  WRichText(
                    text1: "Gender",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,

                  WContainerWithShadow(
                    borderRadius: BorderRadius.circular(32.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.w,
                    ),
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gender", style: AppTextStyles.s14w600),
                        SvgPicture.asset(Assets.dropDownIcon),
                      ],
                    ),
                  ),
                  20.height,
                  WRichText(
                    text1: "Date of Birth",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,

                  WContainerWithShadow(
                    borderRadius: BorderRadius.circular(32.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.w,
                    ),
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Calendar", style: AppTextStyles.s14w600),
                        SvgPicture.asset(Assets.calendarIcon),
                      ],
                    ),
                  ),
                  20.height,
                  WRichText(
                    text1: "Address",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,

                  WTextField(
                    controller: _addressController,
                    hintText: "Address",
                  ),
                ],
              ),
            ),
            20.height,
            WGradientContainer(
              child: Text(
                "Next",
                style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ).paddingAll(24.w),
      ),
    );
  }
}
