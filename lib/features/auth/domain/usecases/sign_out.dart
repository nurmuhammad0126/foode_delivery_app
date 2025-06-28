import 'package:task_for_uicgroup/features/auth/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;
  SignOutUseCase(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}
