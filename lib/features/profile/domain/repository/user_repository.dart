import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser(String id);
  Future<void> addUser(UserModel user);
  Future<UserModel> editUser(String id, UserModel updatedUser);
  Future<void> deleteUser(String id); 
}