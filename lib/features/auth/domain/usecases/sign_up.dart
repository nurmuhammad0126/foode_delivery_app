import 'package:task_for_uicgroup/features/auth/data/model/auth_model.dart';
import 'package:task_for_uicgroup/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;
  
  SignUpUseCase(this.repository);
  Future<AuthModel> call(AuthModel user) async {
    return repository.signUp(user);

  }
} 