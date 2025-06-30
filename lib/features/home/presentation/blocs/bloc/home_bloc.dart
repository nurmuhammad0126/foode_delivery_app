import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/meal_model.dart';
import '../../../data/models/restoran_model.dart';
import '../../../data/models/review_model.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeState.initial()) {
    on<GetRestaurantsEvent>(_getRestaurantsEvent);
    on<GetMealsEvent>(_getMealsEvent);
    on<GetUsersEvent>(_getUsersEvent);
    on<GetReviewsEvent>(_getReviewsEvent);
    on<GetRestaurantEvent>(_getRestaurantEvent);
    on<GetMealEvent>(_getMealEvent);
    on<GetUserEvent>(_getUserEvent);
    on<GetReviewEvent>(_getReviewEvent);
  }
  _getRestaurantsEvent(GetRestaurantsEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getRestaurnts();
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
      },
      (value) {
        emit(
          state.copyWith(homeStatus: HomeStatus.success, restaurants: value),
        );
      },
    );
  }

  _getMealsEvent(GetMealsEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getMeals();
    either.either(
      (failure) {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.error,
            errorMessage: failure.toString(),
          ),
        );
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success, meals: value));
      },
    );
  }

  _getUsersEvent(GetUsersEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getUsers();
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
      },
      (value) {
        log("Malumot keldi $value");
        emit(state.copyWith(homeStatus: HomeStatus.success, users: value));
      },
    );
  }

  _getReviewsEvent(GetReviewsEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getReviews();
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success, reviews: value));
      },
    );
  }

  _getRestaurantEvent(GetRestaurantEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getRestaurnt(event.id);
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
        event.onFailure();
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success));
        event.onSucces();
      },
    );
  }

  _getMealEvent(GetMealEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getMeal(event.id);
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
        event.onFailure();
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success));
        event.onSucces();
      },
    );
  }

  _getUserEvent(GetUserEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getUser(event.id);
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
        event.onFailure();
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success));
        event.onSucces();
      },
    );
  }

  _getReviewEvent(GetReviewEvent event, emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final either = await homeRepository.getReview(event.id);
    either.either(
      (failure) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
        event.onFailure();
      },
      (value) {
        emit(state.copyWith(homeStatus: HomeStatus.success));
        event.onSucces();
      },
    );
  }
}
