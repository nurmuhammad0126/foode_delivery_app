import 'package:hive/hive.dart';

import '../models/chat_model.dart';

class ChatLocalDataSource {
  final Box box = Hive.box('chatBox');
  Future<void> saveMessage(ChatModel chat) async {
    await box.add(chat.toJson);
  }

  List<ChatModel> getMessage() {
    return box.values
        .map((v) => ChatModel.fromJson(Map<String, dynamic>.from(v)))
        .toList()
        .reversed
        .toList();
  }

  Future<void> deleteMessage(String id) async {
    final key = box.keys.firstWhere(
      (k) => box.get(k)['id'] == id,
      orElse: () => null,
    );
    if (key != null) {
      await box.delete(key);
    }
  }

  Future<void> clearMessage() async {
    await box.clear();
  }
}
