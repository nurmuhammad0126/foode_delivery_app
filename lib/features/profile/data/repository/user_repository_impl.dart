import 'package:task_for_uicgroup/core/constants/network_path.dart';
import 'package:task_for_uicgroup/core/dio_client/dio_client.dart';
import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';
import 'package:task_for_uicgroup/features/profile/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  DioClient dioClient;
  UserRepositoryImpl(this.dioClient);

  @override
  Future<void> addUser(UserModel user) async {
    await dioClient.post(NetworkPath.users, user.toJson());
  }

  @override
  Future<UserModel> editUser(String id, UserModel updatedUser) async {
    final response = await dioClient.patch(
      '${NetworkPath.users}/$id}',
      updatedUser.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response = await dioClient.get('${NetworkPath.users}/$id}');
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await dioClient.get(NetworkPath.users);

    if (response.data == null) {
      return [];
    }

    List<UserModel> users = [];
    response.data.forEach((key, value) {
      users.add(UserModel.fromJson(value));
    });

    return users;
  }

  @override
  Future<void> deleteUser(String id) async {
    await dioClient.delete('${NetworkPath.users}/$id');
  }
}
