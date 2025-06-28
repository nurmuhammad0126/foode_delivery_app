import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_for_uicgroup/features/auth/data/model/auth_model.dart';
import 'package:task_for_uicgroup/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_for_uicgroup/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_screen.dart';
import '../../../../core/widgets/w_gradient_container.dart';
import '../../../../core/widgets/w_rich_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignUpRequested(
          AuthModel(
            email: _emaiController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Success'),
                  backgroundColor: AppColors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );

              Future.delayed(Duration(seconds: 0), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (x) => HomeScreen()),
                );
              });
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Image.asset(
                  Assets.logo,
                ).paddingOnly(left: 90.w, right: 90.w, top: 24.w),

                Text("Sign up for free", style: AppTextStyles.s22w600),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email bo‘sh bo‘lishi mumkin emas';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Email noto‘g‘ri kiritilgan';
                          }
                          return null;
                        },
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
                      BlocBuilder<PasswordVisibilityCubit, bool>(
                        builder: (context, isVisible) {
                          return WTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Parol bo‘sh bo‘lishi mumkin emas';
                              }
                              if (value.length < 6) {
                                return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
                              }
                              return null;
                            },
                            hintText: "Password",
                            controller: _passwordController,
                            isObscureText: !isVisible,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                context
                                    .read<PasswordVisibilityCubit>()
                                    .toggle();
                              },
                              child: Icon(
                                isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.gray,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                20.height,
                BlocBuilder<ToggleCubit, bool>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Checkbox(
                          value: state,
                          onChanged: (value) {
                            context.read<ToggleCubit>().toggle(value!);
                          },
                          checkColor: AppColors.white,
                          activeColor: AppColors.primary,
                        ),
                        Text("Remember me", style: AppTextStyles.s14w600),
                      ],
                    );
                  },
                ),

                20.height,

                InkWell(
                  child: BlocBuilder<ToggleCubit, bool>(
                    builder: (context, isChecked) {
                      return WGradientContainer(
                        colors:
                            isChecked
                                ? [Color(0xFFFF7E95), Color(0xFFFF1843)]
                                : [Color(0xFFFF7E95), Color(0xFFFF7E95)],
                        isTextVisible: state is! AuthLoading,
                        onTap: isChecked ? _signUp : () {},
                        child: Text(
                          "Sign in",
                          style: AppTextStyles.s18w600.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                20.height,

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
                32.height,
                WRichText(
                  text1: "Already have an account? ",
                  text2: "Sign in",
                  textStyle1: AppTextStyles.s16w500.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ],
            );
          },
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
