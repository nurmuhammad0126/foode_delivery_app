import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:task_for_uicgroup/features/chat/presentation/bloc/chat_state.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/chat_model.dart';
import '../bloc/chat_event.dart';
import '../widgets/message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            50.height,
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
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return SizedBox.shrink();
                  } else if (state is ChatSuccess) {
                    return ListView.separated(
                      reverse: true,
                      padding: EdgeInsets.only(
                        bottom: 130,
                        right: 20,
                        left: 20,
                      ),
                      separatorBuilder: (context, index) => 20.height,
                      itemCount: state.chatList.length,
                      itemBuilder: (context, index) {
                        final data = state.chatList[index];
                        final isMe = data.name == "Nurmuhammad";
                        return Row(
                          mainAxisAlignment:
                              isMe
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                          children: [MessageWidget(isMe: isMe, data: data)],
                        );
                      },
                    );
                  }
                  return Text('Serverda xatolik');
                },
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
            controller: messageController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<ChatBloc>().add(
                    SendMessage(
                      ChatModel(
                        id: const Uuid().v4(),
                        message: messageController.text.trim(),
                        name: "Nurmuhammad",
                        time: DateTime.now().toIso8601String(),
                      ),
                    ),
                  );
                  messageController.clear();
                },

                icon: Icon(Icons.send),
                color: AppColors.primary,
                // size: 32,
              ),
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
