import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chat_model.dart';
import '../../data/services/web_socket_service.dart';
part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatModel> chat = [];
  ChatBloc() : super(const ChatState.success([])) {
    WebSocketServices.getInstance(
      "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
    );
    WebSocketServices.chanel.stream.listen(
      (event) {
        if (event is String && event.isEmpty) return;
        try {
          add(ChatEvent.addData(ChatModel.fromJson(json.decode(event))));
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      },
      cancelOnError: true,
      onError: (e) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ChatState.error(e.toString()));
        WebSocketServices.getInstance(
          "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
        );
      },
      onDone: () {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ChatState.error('Serverga ulanishda xatolik'));
        WebSocketServices.getInstance(
          "wss://s14781.nyc1.piesocket.com/v3/1?api_key=kLgGoDV7ablppHkpGtqwvb1kGOru8svXMwpu47C3&notify_self=1",
        );
      },
    );
    on<_FetchChat>(_fetchChat);
    on<_AddData>((_AddData event, Emitter<ChatState> emit) {
      chat = [event.data, ...chat];
      add(ChatEvent.fetchChat());
    });

    on<_SendMessage>((_SendMessage event, Emitter<ChatState> emit) {
      WebSocketServices.chanel.sink.add(jsonEncode(event.data.toJson()));
    });
    on<_DeleteMessage>((_DeleteMessage event, Emitter<ChatState> emit) {
      final updatedList = List<ChatModel>.from(
        state.when(
          loading: () => [],
          error: (_) => [],
          success: (chatList) => chatList,
        ),
      )..removeWhere((msg) => msg.id == event.id);
      emit(ChatState.success(updatedList));
    });
  }

  _fetchChat(_FetchChat event, Emitter<ChatState> emit) {
    emit(ChatState.success(chat));
  }
}
