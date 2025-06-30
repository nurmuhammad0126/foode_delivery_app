import 'dart:convert';

class MealModel {
  final String id;
  final String? categoryId;
  final String? createdAt;
  final String? description;
  final String? image;
  final List<String>? ingredients;
  final int? likes;
  final String? name;
  final double? price;
  final String? restaurantId;

  MealModel({
    required this.id,
    required this.categoryId,
    required this.createdAt,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.likes,
    required this.name,
    required this.price,
    required this.restaurantId,
  });

  MealModel copyWith({
    String? id,
    String? categoryId,
    String? createdAt,
    String? description,
    String? image,
    List<String>? ingredients,
    int? likes,
    String? name,
    double? price,
    String? restaurantId,
  }) => MealModel(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    createdAt: createdAt ?? this.createdAt,
    description: description ?? this.description,
    image: image ?? this.image,
    ingredients: ingredients ?? this.ingredients,
    likes: likes ?? this.likes,
    name: name ?? this.name,
    price: price ?? this.price,
    restaurantId: restaurantId ?? this.restaurantId,
  );

  factory MealModel.fromJson(String str) => MealModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MealModel.fromMap(Map<String, dynamic> json) => MealModel(
    id: json["id"],
    categoryId: json["categoryId"],
    createdAt: json["createdAt"],
    description: json["description"],
    image: json["image"],
    ingredients:
        json["ingredients"] != null
            ? List<String>.from(json["ingredients"].map((x) => x))
            : [],

    likes: json["likes"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    restaurantId: json["restaurantId"],
  );

  Map<String, dynamic> toMap() => {
    "categoryId": categoryId,
    "createdAt": createdAt,
    "description": description,
    "image": image,
    "ingredients": List<dynamic>.from(ingredients?.map((x) => x) ?? []),
    "likes": likes,
    "name": name,
    "price": price,
    "restaurantId": restaurantId,
  };
}
