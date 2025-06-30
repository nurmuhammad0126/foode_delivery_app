import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_for_uicgroup/core/dio_client/dio_client.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_for_uicgroup/features/auth/presentation/cubits/auth_cubits.dart';
import 'package:task_for_uicgroup/features/auth/presentation/cubits/forget_password_cubit.dart';
import 'package:task_for_uicgroup/core/routes/router.dart';
import 'package:task_for_uicgroup/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:task_for_uicgroup/features/home/data/datasource/home_datasource.dart';
import 'package:task_for_uicgroup/features/home/domain/repository/home_repository.dart';
import 'package:task_for_uicgroup/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'core/dp/dp_indection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => HomeBloc(
                HomeRepository(HomeDatasourceImpl(getIt<DioClient>())),
              ),
        ),
        BlocProvider(create: (_) => ForgetPasswordCubit()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => ToggleCubit()),
        BlocProvider(create: (_) => PasswordVisibilityCubit()),
        BlocProvider(create: (_) => ChatBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
