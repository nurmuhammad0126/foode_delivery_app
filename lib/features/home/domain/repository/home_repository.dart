// // 📁 lib/data/repositories/restaurant_repository_impl.dart

// import 'package:cloud_firestore/cloud_firestore.dart';
// abstract class RestaurantRepository {
//   // 🔹 CATEGORY
//   Future<List<CategoryModel>> getCategories();

//   // 🔹 MEALS
//   Future<List<MealModel>> getMealsByRestaurant(String restaurantId);
//   Future<void> likeMeal(String mealId, String userId);

//   // 🔹 RESTAURANTS
//   Future<List<RestaurantModel>> getAllRestaurants();
//   Future<RestaurantModel> getRestaurantById(String id);

//   // 🔹 REVIEWS
//   Future<List<ReviewModel>> getReviewsForMeal(String mealId);
//   Future<void> addReview(String mealId, ReviewModel review);

//   // 🔹 USERS
//   Future<UserModel> getUserById(String userId);
//   Future<void> updateUser(UserModel user);
//   Future<void> toggleSavedRestaurant(String userId, String restaurantId);
// }

// class RestaurantRepositoryImpl implements RestaurantRepository {
//   final FirebaseRemoteDatasource remote;
//   RestaurantRepositoryImpl(this.remote);

//   @override
//   Future<List<CategoryModel>> getCategories() => remote.getCategories();

//   @override
//   Future<List<MealModel>> getMealsByRestaurant(String restaurantId) =>
//       remote.getMealsByRestaurant(restaurantId);

//   @override
//   Future<void> likeMeal(String mealId, String userId) =>
//       remote.likeMeal(mealId, userId);

//   @override
//   Future<List<RestaurantModel>> getAllRestaurants() =>
//       remote.getAllRestaurants();

//   @override
//   Future<RestaurantModel> getRestaurantById(String id) =>
//       remote.getRestaurantById(id);

//   @override
//   Future<List<ReviewModel>> getReviewsForMeal(String mealId) =>
//       remote.getReviewsForMeal(mealId);

//   @override
//   Future<void> addReview(String mealId, ReviewModel review) =>
//       remote.addReview(mealId, review);

//   @override
//   Future<UserModel> getUserById(String userId) => remote.getUserById(userId);

//   @override
//   Future<void> updateUser(UserModel user) => remote.updateUser(user);

//   @override
//   Future<void> toggleSavedRestaurant(String userId, String restaurantId) =>
//       remote.toggleSavedRestaurant(userId, restaurantId);
// }
