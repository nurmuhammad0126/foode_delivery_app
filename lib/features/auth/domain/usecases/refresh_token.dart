import 'package:task_for_uicgroup/features/auth/domain/repository/auth_repository.dart';

class RefreshToken {
  final AuthRepository repository;
  RefreshToken(this.repository);

  Future<void> call() async {
    await repository.refreshToken();
  }
}