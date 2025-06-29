import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      if (context.mounted) {
        context.push(AppRoutesNames.onboarding);
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(Assets.backgroundImage),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Center(child: SvgPicture.asset(Assets.logo)),
          ),
        ],
      ),
    );
  }
}
