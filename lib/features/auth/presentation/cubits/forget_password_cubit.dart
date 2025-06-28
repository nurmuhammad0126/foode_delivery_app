import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure("Xatolik: ${e.toString()}"));
    }
  }
}
