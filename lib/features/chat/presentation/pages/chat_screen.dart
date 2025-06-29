import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            30.height,
            WidgetArrowBackButton(text: "Chat"),
            32.height,
            WContainerWithShadow(
              padding: EdgeInsets.all(12),
              border: Border.all(color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: 90.h,
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20.w,
                    children: [
                      SizedBox(
                        width: 64.w,
                        height: 64.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(Assets.personImage1),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Guy Hawkins',
                            style: AppTextStyles.s18w600.copyWith(
                              color: AppColors.neutralBlack,
                            ),
                          ),
                          Text(
                            "Online",
                            style: AppTextStyles.s14w400.copyWith(
                              color: AppColors.neutralWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  WScaleAnimation(
                    onTap: () {
                      context.pushNamed(AppRoutesNames.chatCalling);
                    },
                    child: WContainerWithShadow(
                      borderRadius: BorderRadius.circular(100),
                      border: Border(),
                      color: AppColors.primary100,
                      child: Icon(Icons.call, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: WContainerWithShadow(
          height: 80,
          borderRadius: BorderRadius.circular(20),
          border: Border(),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.send, color: AppColors.primary, size: 32),
              hintText: 'Type message ...',
              hintStyle: AppTextStyles.s16w400.copyWith(
                color: AppColors.neutralWhite,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.white, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
