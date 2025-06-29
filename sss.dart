import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/chat_model.dart';
import '../bloc/chat_bloc.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final ValueNotifier<bool> isTextNotEmpty = ValueNotifier(false);
  final messageController = TextEditingController();
  @override
  void initState() {
    messageController.addListener(() {
      isTextNotEmpty.value = messageController.text.trim().isNotEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    isTextNotEmpty.dispose();
    super.dispose();
  }

  get uuid => null;

  @override
  Widget build(BuildContext context) {
    final uuid = Uuid();
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 7, bottom: 40),
        width: double.infinity,
        child: Row(
          spacing: 15,
          children: [
            InkWell(child: SvgPicture.asset(AppImages.add), onTap: () {}),

            Expanded(
              child: SizedBox(
                height: 42,
                child: TextField(
                  controller: messageController,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppColors.textFieldColor),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 12,
                      ),
                      child: SvgPicture.asset(AppImages.stickers),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isTextNotEmpty,
              builder: (context, value, _) {
                return value
                    ? IconButton(
                        onPressed: () {
                          context.read<ChatBloc>().add(
                            ChatEvent.sendMessage(
                              ChatModel(
                                id: uuid.v4(),
                                message: messageController.text.trim(),
                                name: "Muhammad",
                                time: DateTime.now().toIso8601String(),
                              ),
                            ),
                          );
                          messageController.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                      )
                    : Row(
                        spacing: 15,
                        children: [
                          SvgPicture.asset(AppImages.nimabu),
                          SvgPicture.asset(AppImages.came),
                          SvgPicture.asset(AppImages.voice),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}