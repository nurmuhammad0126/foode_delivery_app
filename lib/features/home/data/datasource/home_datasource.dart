import 'package:task_for_uicgroup/core/constants/network_path.dart';
import 'package:task_for_uicgroup/core/dio_client/dio_client.dart';
import 'package:task_for_uicgroup/features/home/data/models/review_model.dart';
import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

import '../models/meal_model.dart';
import '../models/restoran_model.dart';

abstract class HomeDatasource {
  Future<List<RestaurantModel>> getRestaurnts();
  Future<List<MealModel>> getMeals();
  Future<List<UserModel>> getUsers();
  Future<List<ReviewModel>> getReviews();

  Future<RestaurantModel> getRestaurnt(String id);
  Future<MealModel> getMeal(String id);
  Future<UserModel> getUser(String id);
  Future<ReviewModel> getReview(String id);
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient dioClient;

  HomeDatasourceImpl({required this.dioClient});

  @override
  Future<List<ReviewModel>> getReviews() async {
    try {
      final res = await dioClient.get(NetworkPath.reviews);
      final data = res.data as Map<String, dynamic>;
      final List<ReviewModel> result = [];

      data.forEach((key, value) {
        value["id"] = key;
        result.add(value);
      });
      return result;
    } catch (e) {
      throw "Get reviews Functionsida xato boldi $e";
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final res = await dioClient.get(NetworkPath.users);
      final data = res.data as Map<String, dynamic>;
      final List<UserModel> result = [];

      data.forEach((key, value) {
        value["id"] = key;
        result.add(value);
      });
      return result;
    } catch (e) {
      throw "Get meals Functionsida xato boldi $e";
    }
  }

  @override
  Future<List<MealModel>> getMeals() async {
    try {
      final res = await dioClient.get(NetworkPath.meals);
      final data = res.data as Map<String, dynamic>;
      final List<MealModel> result = [];

      data.forEach((key, value) {
        value["id"] = key;
        result.add(value);
      });
      return result;
    } catch (e) {
      throw "Get meals Functionsida xato boldi $e";
    }
  }

  @override
  Future<List<RestaurantModel>> getRestaurnts() async {
    try {
      final res = await dioClient.get(NetworkPath.restaurants);
      final data = res.data as Map;
      final List<RestaurantModel> result = [];

      data.forEach((key, value) {
        value["id"] = key;
        result.add(value);
      });
      return result;
    } catch (e) {
      throw "Get restoran Functionsida xato boldi $e";
    }
  }

  @override
  Future<MealModel> getMeal(String id) async {
    try {
      final res = await dioClient.get("${NetworkPath.meals}/$id");

      return MealModel.fromMap(res.data);
    } catch (e) {
      throw "Get mealda Functionsida xato boldi $e";
    }
  }

  @override
  Future<RestaurantModel> getRestaurnt(String id) async {
    try {
      final res = await dioClient.get("${NetworkPath.restaurants}/$id");

      return RestaurantModel.fromMap(res.data as Map<String, dynamic>);
    } catch (e) {
      throw "Get Restoran Functionsida xato boldi $e";
    }
  }

  @override
  Future<ReviewModel> getReview(String id) async {
    try {
      final res = await dioClient.get("${NetworkPath.reviews}/$id");
      return ReviewModel.fromMap(res.data);
    } catch (e) {
      throw "Get Reviewda xatolik boldi";
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    try {
      final res = await dioClient.get("${NetworkPath.users}/$id");
      return UserModel.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw "Get User Functionida xatolik boldi";
    }
  }
}
