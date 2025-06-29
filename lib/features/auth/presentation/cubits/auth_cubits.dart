import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  void toggle(bool value) => emit(value);
}

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false);
  void toggle() => emit(!state);
}
