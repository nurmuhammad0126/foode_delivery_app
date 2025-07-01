import 'dart:developer';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_datasource.dart';
import '../models/meal_model.dart';
import '../models/restoran_model.dart';
import '../models/review_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasourceImpl homeRepositoryImpl;

  HomeRepositoryImpl({required this.homeRepositoryImpl});

  @override
  Future<Either<Failure, MealModel>> getMeal(String id) async {
    try {
      final data = await homeRepositoryImpl.getMeal(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getMeals() async {
    try {
      final data = await homeRepositoryImpl.getMeals();
      log("Malumot keldi $data");
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RestaurantModel>> getRestaurnt(String id) async {
    try {
      final data = await homeRepositoryImpl.getRestaurnt(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantModel>>> getRestaurnts() async {
    try {
      final data = await homeRepositoryImpl.getRestaurnts();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewModel>> getReview(String id) async {
    try {
      final data = await homeRepositoryImpl.getReview(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews() async {
    try {
      final data = await homeRepositoryImpl.getReviews();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(String id) async {
    try {
      final data = await homeRepositoryImpl.getUser(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final data = await homeRepositoryImpl.getUsers();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
