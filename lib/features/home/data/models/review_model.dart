import 'dart:convert';

class ReviewModel {
  final String comment;
  final DateTime createdAt;
  final String mealId;
  final int rating;
  final String userId;

  ReviewModel({
    required this.comment,
    required this.createdAt,
    required this.mealId,
    required this.rating,
    required this.userId,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> json) {
    return ReviewModel(
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      mealId: json['mealId'] as String,
      rating: json['rating'] as int,
      userId: json['userId'] as String,
    );
  }
  factory ReviewModel.fromJson(String json) =>
      ReviewModel.fromMap(jsonDecode(json));
  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'mealId': mealId,
      'rating': rating,
      'userId': userId,
    };
  }
}
