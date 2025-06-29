import 'package:task_for_uicgroup/core/either/either.dart';
import 'package:task_for_uicgroup/core/failure/failure.dart';

import '../../data/models/meal_model.dart';
import '../../data/models/restoran_model.dart';
import '../../data/models/review_model.dart';
import '../../data/models/user_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RestaurantModel>>> getRestaurnts();
  Future<Either<Failure, List<MealModel>>> getMeals();
  Future<Either<Failure, List<UserModel>>> getUsers();
  Future<Either<Failure, List<ReviewModel>>> getReviews();
  Future<Either<Failure, RestaurantModel>> getRestaurnt(String id);
  Future<Either<Failure, MealModel>> getMeal(String id);
  Future<Either<Failure, UserModel>> getUser(String id);
  Future<Either<Failure, ReviewModel>> getReview(String id);
}
