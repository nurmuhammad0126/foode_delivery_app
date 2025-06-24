import 'package:flutter/material.dart';

class WGradientContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double height;
  final BorderRadius? borderRadius;
  final List<Color> colors;
  final TextStyle? textStyle;

  const WGradientContainer({
    super.key,
    required this.child,
    required this.onTap,
    this.height = 56,
    this.borderRadius,
    this.colors = const [Color(0xFFFF7E95), Color(0xFFFF1843)],
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
