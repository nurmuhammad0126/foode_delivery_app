part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.fetchChat() = _FetchChat;
  const factory ChatEvent.addData(ChatModel data) = _AddData;
  const factory ChatEvent.sendMessage(ChatModel data) = _SendMessage;
  const factory ChatEvent.deleteMessage(String id) = _DeleteMessage;
}
