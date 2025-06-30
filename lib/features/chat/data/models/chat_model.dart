class ChatModel {
  final String id;
  final String message;
  final String name;
  final String time;
  ChatModel({
    required this.id,
    required this.message,
    required this.name,
    required this.time,
  });
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'message': message, 'time': time};
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      message: json['message'],
      name: json['name'],
      time: json['time'],
    );
  }
}