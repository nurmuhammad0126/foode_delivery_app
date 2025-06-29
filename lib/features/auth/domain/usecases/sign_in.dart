import 'package:task_for_uicgroup/features/auth/data/model/auth_model.dart';
import 'package:task_for_uicgroup/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase(this.repository);

  Future<AuthModel> call(AuthModel user) async {
    return repository.signIn(user);
  }
}
