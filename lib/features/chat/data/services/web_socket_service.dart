import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketServices {
  static late WebSocketChannel chanel;
  static void getInstance(String ws) {
    chanel = WebSocketChannel.connect(Uri.parse(ws));
  }
}
