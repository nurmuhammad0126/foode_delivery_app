import '../../data/models/chat_model.dart';

abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<ChatModel> chatList;
  ChatSuccess(this.chatList);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
