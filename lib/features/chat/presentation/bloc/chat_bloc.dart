import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_model.dart';
import '../../data/services/web_socket_service.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatModel> chatList = [];

  ChatBloc() : super(ChatLoading()) {
    // WebSocket ulanish
    WebSocketServices.getInstance(
      "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
    );

    // Stream tinglash
    WebSocketServices.chanel.stream.listen(
      (event) {
        if (event is String && event.isNotEmpty) {
          try {
            final chat = ChatModel.fromJson(json.decode(event));
            add(AddData(chat));
          } catch (e) {
            if (kDebugMode) print(e);
          }
        }
      },
      cancelOnError: true,
      onError: (e) {
        emit(ChatError(e.toString()));
        WebSocketServices.getInstance(
          "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
        );
      },
      onDone: () {
        emit(ChatError("Serverga ulanishda xatolik"));
        WebSocketServices.getInstance(
          "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
        );
      },
    );

    // Eventlar
    on<FetchChat>((event, emit) {
      emit(ChatSuccess(List.from(chatList)));
    });

    on<AddData>((event, emit) {
      chatList.insert(0, event.data);
      emit(ChatSuccess(List.from(chatList)));
    });

    on<SendMessage>((event, emit) {
      final jsonStr = jsonEncode(event.data.toJson());
      WebSocketServices.chanel.sink.add(jsonStr);
    });

    on<DeleteMessage>((event, emit) {
      chatList.removeWhere((msg) => msg.id == event.id);
      emit(ChatSuccess(List.from(chatList)));
    });
  }
}
