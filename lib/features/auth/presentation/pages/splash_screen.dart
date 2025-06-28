import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_for_uicgroup/features/auth/data/datasource/local_datasource.dart';
import 'package:task_for_uicgroup/features/home/presentation/pages/home_screen.dart';
import 'package:task_for_uicgroup/features/auth/presentation/pages/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();

  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

Future<void> _navigateUser() async {
  await Future.delayed(Duration(seconds: 2));

  final user = FirebaseAuth.instance.currentUser;
  final token = await authLocalDatasource.getToken();

  if (user != null && token != null) {
    final newToken = await user.getIdToken(true);
    await authLocalDatasource.saveToken(newToken.toString());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              Assets.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(Assets.logo),
          ),
        ],
      ),
    );
  }
}
