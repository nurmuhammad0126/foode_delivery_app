import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/auth/presentation/cubits/forget_password_cubit.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onNextTap() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().sendResetLink(_emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Tasdiqlash kodi emailingizga yuborildi"),
                backgroundColor: AppColors.green,
              ),
            );

            // asldkjfals;kdjfn
            Future.delayed(Duration(seconds: 1), () {
              return Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            });
          } else if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.primary,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24.w,
              children: [
                24.height,
                WidgetArrowBackButton(text: "Forgot password?"),
                Text(
                  "Select which contact details should we use to reset your password",
                  style: AppTextStyles.s16w400,
                ),
                20.height,
                WRichText(
                  text1: "Enter your email",
                  text2: "*",
                ).paddingOnly(left: 24.w),
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
                  hintText: "Enter your email",
                  controller: _emailController,
                ),
                const Spacer(),
                WGradientContainer(
                  isTextVisible: state is! ForgetPasswordLoading,
                  onTap: _onNextTap,
                  child: Text(
                    "Next",
                    style: AppTextStyles.s18w600.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ).paddingAll(24.w),
          );
        },
      ),
    );
  }
}
