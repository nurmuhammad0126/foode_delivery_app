class UserModel {
  final DateTime createdAt;
  final String email;
  final Map<String, bool> likedMeals;
  final Location location;
  final String name;
  final String photoUrl;
  final Map<String, bool> savedRestaurants;

  UserModel({
    required this.createdAt,
    required this.email,
    required this.likedMeals,
    required this.location,
    required this.name,
    required this.photoUrl,
    required this.savedRestaurants,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String,
      likedMeals: Map<String, bool>.from(json['likedMeals'] as Map),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      savedRestaurants: Map<String, bool>.from(json['savedRestaurants'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'email': email,
      'likedMeals': likedMeals,
      'location': location.toJson(),
      'name': name,
      'photoUrl': photoUrl,
      'savedRestaurants': savedRestaurants,
    };
  }
}

class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
