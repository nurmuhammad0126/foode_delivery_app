part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

class GetRestaurantsEvent extends HomeEvent {
  const GetRestaurantsEvent();
}

class GetMealsEvent extends HomeEvent {
  const GetMealsEvent();
}

class GetUsersEvent extends HomeEvent {
  const GetUsersEvent();
}

class GetReviewsEvent extends HomeEvent {
  const GetReviewsEvent();
}

class GetRestaurantEvent extends HomeEvent {
 final String id;
  final VoidCallback onFailure;
  final VoidCallback onSucces;

 const GetRestaurantEvent({required this.id, required this.onFailure, required this.onSucces});

}

class GetMealEvent extends HomeEvent {
  final String id;
  final VoidCallback onFailure;
  final VoidCallback onSucces;

  const GetMealEvent({
    required this.id,
    required this.onFailure,
    required this.onSucces,
  });
}

class GetUserEvent extends HomeEvent {
  final String id;
  final VoidCallback onFailure;
  final VoidCallback onSucces;

  const GetUserEvent({required this.id, required this.onFailure, required this.onSucces});

}

class GetReviewEvent extends HomeEvent {
  final String id;
  final VoidCallback onFailure;
  final VoidCallback onSucces;

  const GetReviewEvent({required this.id, required this.onFailure, required this.onSucces});

}
