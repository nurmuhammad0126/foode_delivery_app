// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import '../models/home_models.dart';

// class FirebaseRemoteDatasource {
//   final _db = FirebaseDatabase.instance.ref();

//   /// 🔹 Get all categories
//   Future<List<CategoryModel>> getAllCategories() async {
//     final snapshot = await _db.child('categories').get();
//     if (snapshot.exists) {
//       final data = Map<String, dynamic>.from(snapshot.value as Map);
//       return data.entries
//           .map((e) => CategoryModel.fromJson({...e.value, 'id': e.key}))
//           .toList();
//     }
//     return [];
//   }

//   /// 🔹 Get all meals
//   Future<List<MealModel>> getAllMeals() async {
//     final snapshot = await _db.child('meals').get();
//     if (snapshot.exists) {
//       final data = Map<String, dynamic>.from(snapshot.value as Map);
//       return data.entries
//           .map((e) => MealModel.fromJson({...e.value, 'id': e.key}))
//           .toList();
//     }
//     return [];
//   }

//   /// 🔹 Get all restaurants
//   Future<List<RestaurantModel>> getAllRestaurants() async {
//     final snapshot = await _db.child('restaurants').get();
//     if (snapshot.exists) {
//       final data = Map<String, dynamic>.from(snapshot.value as Map);
//       return data.entries
//           .map((e) => RestaurantModel.fromJson({...e.value, 'id': e.key}))
//           .toList();
//     }
//     return [];
//   }

//   /// 🔹 Get all reviews
//   Future<List<ReviewModel>> getAllReviews() async {
//     final snapshot = await _db.child('reviews').get();
//     if (snapshot.exists) {
//       final data = Map<String, dynamic>.from(snapshot.value as Map);
//       return data.entries
//           .map((e) => ReviewModel.fromJson({...e.value, 'id': e.key}))
//           .toList();
//     }
//     return [];
//   }

//   /// 🔹 Get user by ID
//   Future<UserModel?> getUser(String userId) async {
//     final snapshot = await _db.child('users/$userId').get();
//     if (snapshot.exists) {
//       return UserModel.fromJson({...snapshot.value as Map, 'id': userId});
//     }
//     return null;
//   }

//   /// 🔹 Create or update user
//   Future<void> createOrUpdateUser(UserModel user) async {
//     await _db.child('users/${user.id}').set(user.toJson());
//   }

//   /// 🔹 Create or update meal
//   Future<void> createOrUpdateMeal(MealModel meal) async {
//     await _db.child('meals/${meal.id}').set(meal.toJson());
//   }

//   /// 🔹 Create or update restaurant
//   Future<void> createOrUpdateRestaurant(RestaurantModel restaurant) async {
//     await _db.child('restaurants/${restaurant.id}').set(restaurant.toJson());
//   }

//   /// 🔹 Create review
//   Future<void> createReview(ReviewModel review) async {
//     await _db.child('reviews/${review.id}').set(review.toJson());
//   }

//   /// 🔹 Update user likedMeals
//   Future<void> updateLikedMeals(String userId, Map<String, bool> likedMeals) async {
//     await _db.child('users/$userId/likedMeals').set(likedMeals);
//   }

//   /// 🔹 Update saved restaurants
//   Future<void> updateSavedRestaurants(String userId, Map<String, bool> savedRestaurants) async {
//     await _db.child('users/$userId/savedRestaurants').set(savedRestaurants);
//   }
// }
