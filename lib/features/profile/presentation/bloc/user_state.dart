import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UsersLoadedState extends UserState {
  final List<UserModel> users;
  UsersLoadedState(this.users);
}

class UserLoadedState extends UserState {
  final UserModel user;
  UserLoadedState(this.user);
}

class UserOperationSuccessState extends UserState {
  final String message;
  UserOperationSuccessState(this.message);
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}