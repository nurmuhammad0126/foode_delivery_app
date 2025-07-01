class UserModel {
  final String? id;
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
    this.id,
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

  factory UserModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return UserModel(
      id: id,
      phoneNumber: json['phoneNumber'] as String?,
      adress: json['adress'] as String?,
      userName: json['userName'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      email: json['email'] as String?,
      likedMeals: json['likedMeals'] != null
          ? _convertToStringBoolMap(json['likedMeals'])
          : null,
      location: json['location'] != null
          ? Locationn.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      savedRestaurants: json['savedRestaurants'] != null
          ? _convertToStringBoolMap(json['savedRestaurants'])
          : null,
    );
  }

  static Map<String, bool>? _convertToStringBoolMap(dynamic value) {
    if (value == null) return null;
    if (value is Map) {
      final Map<String, bool> result = {};
      value.forEach((key, val) {
        if (key is String) {
          result[key] = val == true || val == 'true';
        }
      });
      return result;
    }
    return null;
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
    String? id,
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
      id: id ?? this.id,
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