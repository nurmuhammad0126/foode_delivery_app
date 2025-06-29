class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  factory CategoryModel.fromMap(String id, Map data) => CategoryModel(
    id: id,
    name: data['name'],
    image: data['image'],
  );

  Map<String, dynamic> toMap() => {'name': name, 'image': image};
}

class MealModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<String> ingredients;
  final double price;
  final String categoryId;
  final String restaurantId;
  final DateTime? createdAt;
  final int likes;

  MealModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.restaurantId,
    this.description = '',
    this.image = '',
    this.ingredients = const [],
    this.createdAt,
    this.likes = 0,
  });

  factory MealModel.fromMap(String id, Map data) => MealModel(
    id: id,
    name: data['name'],
    price: data['price'].toDouble(),
    categoryId: data['categoryId'],
    restaurantId: data['restaurantId'],
    description: data['description'] ?? '',
    image: data['image'] ?? '',
    ingredients: List<String>.from(data['ingredients'] ?? []),
    likes: data['likes'] ?? 0,
    createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'price': price,
    'categoryId': categoryId,
    'restaurantId': restaurantId,
    'description': description,
    'image': image,
    'ingredients': ingredients,
    'likes': likes,
    'createdAt': createdAt?.toIso8601String(),
  };
}

class RestaurantModel {
  final String id;
  final String name;
  final String logo;
  final double rating;
  final String category;
  final Map<String, bool> meals;
  final double lat;
  final double lng;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.rating,
    required this.category,
    required this.meals,
    required this.lat,
    required this.lng,
  });

  factory RestaurantModel.fromMap(String id, Map data) => RestaurantModel(
    id: id,
    name: data['name'],
    logo: data['logo'],
    rating: data['rating'].toDouble(),
    category: data['category'],
    meals: Map<String, bool>.from(data['meals'] ?? {}),
    lat: data['location']['lat'],
    lng: data['location']['lng'],
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'logo': logo,
    'rating': rating,
    'category': category,
    'meals': meals,
    'location': {'lat': lat, 'lng': lng},
  };
}

class ReviewModel {
  final String id;
  final String userId;
  final String comment;
  final double rating;
  final String mealId;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.comment,
    required this.rating,
    required this.mealId,
    required this.createdAt,
  });

  factory ReviewModel.fromMap(String id, Map data) => ReviewModel(
    id: id,
    userId: data['userId'],
    comment: data['comment'],
    rating: data['rating'].toDouble(),
    mealId: data['mealId'],
    createdAt: DateTime.parse(data['createdAt']),
  );

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'comment': comment,
    'rating': rating,
    'mealId': mealId,
    'createdAt': createdAt.toIso8601String(),
  };
}
