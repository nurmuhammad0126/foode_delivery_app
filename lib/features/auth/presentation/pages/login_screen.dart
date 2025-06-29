import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/routes/router.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/w_gradient_container.dart';
import '../../../../core/widgets/w_rich_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Assets.logo,
            ).paddingOnly(left: 90.w, right: 90.w, top: 24.w),

            Text("Sign in to your account", style: AppTextStyles.s22w600),
            32.height,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WRichText(
                    text1: "Email ",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    hintText: "Email or Phone Number",
                    controller: _emaiController,
                  ),
                  _emaiController.text.isEmpty
                      ? Container(
                        margin: EdgeInsets.only(top: 12.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: AppColors.gray100,
                        ),
                        child: Row(
                          spacing: 8.w,
                          children: [
                            Icon(
                              Icons.error,
                              color: AppColors.darkGray,
                              size: 21,
                            ),
                            Text(
                              "This is a message",
                              style: AppTextStyles.s12w400,
                            ),
                          ],
                        ),
                      )
                      : SizedBox(),
                  20.height,
                  WRichText(
                    text1: "Password ",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    hintText: "Password",
                    controller: _passwordController,
                    isObscureText: false,
                    suffixIcon: Icon(
                      Icons.visibility_sharp,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            20.height,
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  checkColor: AppColors.white,
                  activeColor: AppColors.primary,
                ),
                Text("Remember me", style: AppTextStyles.s14w600),
              ],
            ),
            20.height,

            WScaleAnimation(
              onTap: () {
                context.goToHome();
              },
              child: WGradientContainer(
                child: Text(
                  "Sign in",
                  style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
                ),
              ),
            ),
            20.height,
            WScaleAnimation(
              child: Text(
                "Forgot the password?",
                style: AppTextStyles.s16w600.copyWith(color: AppColors.primary),
              ),
              onTap: () {
                context.push(AppRoutesNames.forgetPassword);
              },
            ),
            32.height,

            Text("or continue with", style: AppTextStyles.s16w400),
            24.height,
            Row(
              spacing: 24.w,
              children: [
                Expanded(
                  child: WContainerWithShadow(
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12.w,
                      children: [
                        SvgPicture.asset(Assets.facebookLogo),
                        Text("Facebook", style: AppTextStyles.s16w600),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: WContainerWithShadow(
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12.w,
                      children: [
                        SvgPicture.asset(Assets.googleLogo),
                        Text("Google", style: AppTextStyles.s16w600),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WRichText(
        text1: "Don’t have an account? ",
        text2: "Sign up",
        textStyle1: AppTextStyles.s16w500.copyWith(color: AppColors.gray),
        onTapText2: () {
          context.push(AppRoutesNames.register);
        },
      ),
    );
  }
}
