import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_uicgroup/features/auth/data/datasource/remote_datasource.dart';
import 'package:task_for_uicgroup/features/auth/data/repository/auth_repository_impl.dart';
import 'package:task_for_uicgroup/features/auth/domain/usecases/sign_in.dart';
import 'package:task_for_uicgroup/features/auth/domain/usecases/sign_up.dart';
import 'package:task_for_uicgroup/features/auth/data/model/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final SignInUseCase signInUseCase;
  late final SignUpUseCase signUpUseCase;

  AuthBloc() : super(AuthInitial()) {
    final repository = AuthRepositoryImpl(AuthRemoteDatasource());
    signInUseCase = SignInUseCase(repository);
    signUpUseCase = SignUpUseCase(repository);

    on<SignInRequested>(_signIn);
    on<SignUpRequested>(_signUp);
  }

  Future<void> _signIn(SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signInUseCase(event.user);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _signUp(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await signUpUseCase(event.user);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
