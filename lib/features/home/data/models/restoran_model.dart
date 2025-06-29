import 'dart:convert';

class RestaurantModel {
  final String category;
  final Location location;
  final String logo;
  final Map<String, bool> meals;
  final String name;
  final double rating;

  RestaurantModel({
    required this.category,
    required this.location,
    required this.logo,
    required this.meals,
    required this.name,
    required this.rating,
  });

  factory RestaurantModel.fromMap(Map<String, dynamic> json) {
    return RestaurantModel(
      category: json['category'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      logo: json['logo'] as String,
      meals: Map<String, bool>.from(json['meals'] as Map),
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
  factory RestaurantModel.fromJson(String json) =>
      RestaurantModel.fromMap(jsonDecode(json));
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'location': location.toJson(),
      'logo': logo,
      'meals': meals,
      'name': name,
      'rating': rating,
    };
  }
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}
