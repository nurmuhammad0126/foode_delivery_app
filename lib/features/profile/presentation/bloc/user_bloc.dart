import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_for_uicgroup/features/profile/domain/repository/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitialState()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<LoadUserEvent>(_onLoadUser);
    on<AddUserEvent>(_onAddUser);
    on<EditUserEvent>(_onEditUser);
    on<DeleteUserEvent>(_onDeleteUser);
  }

  Future<void> _onLoadUsers(LoadUsersEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      final users = await userRepository.getUsers();
      emit(UsersLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      final user = await userRepository.getUser(event.id);
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onAddUser(AddUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      await userRepository.addUser(event.user);
      emit(UserOperationSuccessState('User added successfully'));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onEditUser(EditUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      final updatedUser = await userRepository.editUser(event.id, event.updatedUser);
      emit(UserLoadedState(updatedUser));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onDeleteUser(DeleteUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      await userRepository.deleteUser(event.id);
      emit(UserOperationSuccessState('User deleted successfully'));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}