import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/features/auth/data/datasource/local_datasource.dart';
import 'package:task_for_uicgroup/features/profile/data/repository/user_local_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();
  final UserLocalRepository userLocalRepository = UserLocalRepository();

  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;
    final token = await authLocalDatasource.getToken();
    final profileCompleted = await userLocalRepository.isProfileCompleted();

    if (user != null && token != null && profileCompleted == true) {
      final newToken = await user.getIdToken(true);
      await authLocalDatasource.saveToken(newToken ?? "");
      context.goNamed(AppRoutesNames.home);
    } else {
      if (mounted) context.goNamed(AppRoutesNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.backgroundImage, fit: BoxFit.cover),
          ),
          Center(child: Image.asset(Assets.logo)),
        ],
      ),
    );
  }
}
