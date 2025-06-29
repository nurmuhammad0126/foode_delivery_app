import 'package:chat_web_socket/core/utils/app_colors.dart';
import 'package:chat_web_socket/core/utils/app_images.dart';
import 'package:chat_web_socket/feature/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundImage: AssetImage(AppImages.avatar),
            ),
            Text('Bro'),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 25,
          ),
        ),
        actions: [
          SvgPicture.asset(AppImages.videoCall),
          SizedBox(width: 25),
          SvgPicture.asset(AppImages.call),
          SizedBox(width: 25),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return state.when(
                loading: () =>
                    Center(child: CircularProgressIndicator.adaptive()),
                error: (error) => Center(child: Text(error)),
                success: (chat) {
                  return ListView.separated(
                    reverse: true,
                    padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 4, height: 15),
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      final data = chat[index];
                      final isMe = data.name == "Muhammad";
                      return Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isMe)
                            Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 25,
                                  backgroundImage: AssetImage(AppImages.avatar),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          MessageWidget(isMe: isMe, data: data),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}