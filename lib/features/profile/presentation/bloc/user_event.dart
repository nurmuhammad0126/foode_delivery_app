import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

abstract class UserEvent {}

class LoadUsersEvent extends UserEvent {}

class LoadUserEvent extends UserEvent {
  final String id;
  LoadUserEvent(this.id);
}

class AddUserEvent extends UserEvent {
  final UserModel user;
  AddUserEvent(this.user);
}

class EditUserEvent extends UserEvent {
  final String id;
  final UserModel updatedUser;
  EditUserEvent(this.id, this.updatedUser);
}

class DeleteUserEvent extends UserEvent {
  final String id;
  DeleteUserEvent(this.id);
}