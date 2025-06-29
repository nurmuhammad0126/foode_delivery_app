import 'package:flutter/material.dart';

class WGradientContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final List<Color> colors;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final bool isTextVisible;
  const WGradientContainer({
    super.key,
    required this.child,
    this.height = 56,
    this.borderRadius,
    this.colors = const [Color(0xFFFF7E95), Color(0xFFFF1843)],
    this.padding,
    this.width,
    this.margin,
    this.onTap,
    this.isTextVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(32),
      onTap: onTap ?? () {},
      child: Container(
        height: height,
        width: width ?? double.infinity,
        padding: padding ?? EdgeInsets.all(12),
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(32),
        ),
        child:
            isTextVisible
                ? child
                : const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}
