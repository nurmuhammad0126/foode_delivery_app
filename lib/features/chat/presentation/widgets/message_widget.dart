import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import '../../data/models/chat_model.dart';

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final ChatModel data;

  const MessageWidget({super.key, required this.isMe, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isMe ? AppColors.colorForChip : AppColors.background,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              data.message,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
