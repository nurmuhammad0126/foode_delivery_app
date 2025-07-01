import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

abstract class UserRepository {
  Future<String> addUser(UserModel user);
  Future<UserModel> editUser(String id, UserModel updatedUser);
  Future<UserModel> getUser(String id);
  Future<List<UserModel>> getUsers();
  Future<void> deleteUser(String id);
}