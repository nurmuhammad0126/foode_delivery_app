  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:task_for_uicgroup/core/dio_client/dio_client.dart';
  import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
  import 'package:task_for_uicgroup/core/routes/router.dart';
  import 'package:task_for_uicgroup/features/auth/presentation/bloc/auth_bloc.dart';
  import 'package:task_for_uicgroup/features/auth/presentation/cubits/auth_cubits.dart';
  import 'package:task_for_uicgroup/features/auth/presentation/cubits/forget_password_cubit.dart';
  import 'package:task_for_uicgroup/features/profile/data/repository/user_repository_impl.dart';
  import 'package:task_for_uicgroup/features/profile/domain/repository/user_repository.dart';
  import 'package:task_for_uicgroup/features/profile/presentation/bloc/user_bloc.dart';
  import 'firebase_options.dart';

  final dioClient = DioClient();
  final UserRepository userRepository = UserRepositoryImpl(dioClient);
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
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
          BlocProvider(create: (_) => UserBloc(userRepository)),
          BlocProvider(create: (_) => ForgetPasswordCubit()),
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => ToggleCubit()),
          BlocProvider(create: (_) => PasswordVisibilityCubit()),
        ],
        child: MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
        ),
      );
    }
  }
