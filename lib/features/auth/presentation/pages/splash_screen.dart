import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.push(context, MaterialPageRoute(builder: (x) => SecondPage()));
    // });
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
