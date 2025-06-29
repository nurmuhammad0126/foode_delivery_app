import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObservice extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange <${bloc.runtimeType}>');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('onError <${bloc.runtimeType}, $error, $stackTrace>');
  }
}
