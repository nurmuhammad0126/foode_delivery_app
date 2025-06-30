part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

class HomeState {
  final HomeStatus homeStatus;
  final List<RestaurantModel> restaurants;
  final List<MealModel> meals;
  final List<UserModel> users;
  final List<ReviewModel> reviews;

  final String errorMessage;

  HomeState({required this.errorMessage,
    required this.reviews,
    required this.users,
    required this.homeStatus,
    required this.restaurants,
    required this.meals,
  });

  HomeState copyWith({
    String? errorMessage,
    List<ReviewModel>? reviews,
    List<UserModel>? users,
    HomeStatus? homeStatus,
    List<RestaurantModel>? restaurants,
    List<MealModel>? meals,
  }) {
    return HomeState(
      errorMessage: errorMessage??this.errorMessage,
      reviews: reviews ?? this.reviews,
      users: users ?? this.users,
      homeStatus: homeStatus ?? this.homeStatus,
      restaurants: restaurants ?? this.restaurants,
      meals: meals ?? this.meals,
    );
  }

  factory HomeState.initial() => HomeState(
    errorMessage: "",
    homeStatus: HomeStatus.loading,
    restaurants: [],
    meals: [],
    users: [],
    reviews: [],
  );
}
