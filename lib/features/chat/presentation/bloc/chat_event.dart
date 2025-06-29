import '../../data/models/chat_model.dart';

abstract class ChatEvent {}

class FetchChat extends ChatEvent {}

class AddData extends ChatEvent {
  final ChatModel data;
  AddData(this.data);
}

class SendMessage extends ChatEvent {
  final ChatModel data;
  SendMessage(this.data);
}

class DeleteMessage extends ChatEvent {
  final String id;
  DeleteMessage(this.id);
}
