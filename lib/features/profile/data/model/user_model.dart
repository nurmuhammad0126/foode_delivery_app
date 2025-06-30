class UserModel {
  final DateTime? createdAt;
  final String? email;
  final Map<String, bool>? likedMeals;
  final Locationn? location;
  final String? name;
  final String? photoUrl;
  final Map<String, bool>? savedRestaurants;
  final String? userName;
  final String? adress;
  final String? phoneNumber;

  UserModel({
    this.phoneNumber,
    this.userName,
    this.createdAt,
    this.email,
    this.likedMeals,
    this.location,
    this.name,
    this.photoUrl,
    this.savedRestaurants,
    this.adress,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['phoneNumber'] as String?,
      adress: json['adress'] as String?,
      userName: json['userName'] as String?,
      createdAt:
          json['createdAt'] != null
              ? DateTime.parse(json['createdAt'] as String)
              : null,
      email: json['email'] as String?,
      likedMeals:
          json['likedMeals'] != null
              ? Map<String, bool>.from(json['likedMeals'] as Map)
              : null,
      location:
          json['location'] != null
              ? Locationn.fromJson(json['location'] as Map<String, dynamic>)
              : null,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      savedRestaurants:
          json['savedRestaurants'] != null
              ? Map<String, bool>.from(json['savedRestaurants'] as Map)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'adress': adress,
      'userName': userName,
      'createdAt':
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'email': email,
      'likedMeals': likedMeals,
      'location': location?.toJson(),
      'name': name,
      'photoUrl': photoUrl,
      'savedRestaurants': savedRestaurants,
    };
  }

  UserModel copyWith({
    String? phoneNumber,
    String? adress,
    DateTime? createdAt,
    String? userName,
    String? email,
    Map<String, bool>? likedMeals,
    Locationn? location,
    String? name,
    String? photoUrl,
    Map<String, bool>? savedRestaurants,
  }) {
    return UserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      adress: adress ?? this.adress,
      userName: userName ?? this.userName,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      likedMeals: likedMeals ?? this.likedMeals,
      location: location ?? this.location,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      savedRestaurants: savedRestaurants ?? this.savedRestaurants,
    );
  }
}

class Locationn {
  final double? lat;
  final double? lng;

  Locationn({this.lat, this.lng});

  factory Locationn.fromJson(Map<String, dynamic> json) {
    return Locationn(
      lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
      lng: json['lng'] != null ? (json['lng'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }

  Locationn copyWith({double? lat, double? lng}) {
    return Locationn(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }
}
