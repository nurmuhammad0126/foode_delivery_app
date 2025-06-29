import 'dart:convert';

class CategoryModel {
  final String id;
  final String image;
  final String name;

  CategoryModel({required this.image, required this.name, required this.id});

  CategoryModel copyWith({String? id, String? image, String? name}) => CategoryModel(
    id: id ?? this.id,
    image: image ?? this.image,
    name: name ?? this.name,
  );

  factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) =>
      CategoryModel(id: json["id"], image: json["image"], name: json["name"]);

  Map<String, dynamic> toMap() => {"image": image, "name": name};
}

