import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/utils/global_user.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:task_for_uicgroup/features/auth/data/model/auth_model.dart';
import 'package:task_for_uicgroup/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_for_uicgroup/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignUpRequested(
          AuthModel(
            email: _emailController.text,
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

              /// GoRouter orqali navigatsiya
              context.go(AppRoutesNames.verifyBio);
              setGlobalUser(
                UserModel(
                  createdAt: DateTime.now(),
                  email: _emailController.text,
                ),
              );
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
                        controller: _emailController,
                        hintText: "Email or Phone Number",
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
                      ),
                      20.height,
                      WRichText(
                        text1: "Password ",
                        text2: "*",
                      ).paddingOnly(left: 24.w),
                      8.height,
                      BlocBuilder<PasswordVisibilityCubit, bool>(
                        builder: (context, isVisible) {
                          return WTextField(
                            controller: _passwordController,
                            hintText: "Password",
                            isObscureText: !isVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Parol bo‘sh bo‘lishi mumkin emas';
                              }
                              if (value.length < 6) {
                                return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap:
                                  () =>
                                      context
                                          .read<PasswordVisibilityCubit>()
                                          .toggle(),
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
                  builder: (context, isChecked) {
                    return Row(
                      children: [
                        Checkbox(
                          value: isChecked,
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
                BlocBuilder<ToggleCubit, bool>(
                  builder: (context, isChecked) {
                    return WScaleAnimation(
                      onTap: isChecked ? _signUp : () {},
                      child: WGradientContainer(
                        colors:
                            isChecked
                                ? [Color(0xFFFF7E95), Color(0xFFFF1843)]
                                : [Color(0xFFFF7E95), Color(0xFFFF7E95)],
                        isTextVisible: state is! AuthLoading,

                        child: Text(
                          "Sign up",
                          style: AppTextStyles.s18w600.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    );
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
                32.height,
                WRichText(
                  text1: "Already have an account? ",
                  text2: "Sign in",
                  textStyle1: AppTextStyles.s16w500.copyWith(
                    color: AppColors.gray,
                  ),
                  onTapText2: () {
                    context.push(AppRoutesNames.login);
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 24.w);
          },
        ),
      ),
    );
  }
}
