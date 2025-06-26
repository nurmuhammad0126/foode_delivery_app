import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // static class

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Brand
  static const Color primary = Color(0xFFFF1843);
  static const Color primaryLight = Color(0xFFFF7E95);
  static const Color primary100 = Color(0x1AF43F5E); // 10% opacity
  static const Color primary500 = Color(0x80F43F5E); // 50% opacity
  static const Color colorForChip = Color(0xFFF43F5E); // 50% opacity

  // Neutrals / Grays
  static const Color shadow = Color(0xFFEBEEF2);
  static final Color shadowBlue = Color(0xFF5A6CEA).withOpacity(0.1);

  static const Color gray = Color(0xFF6D7580);
  static const Color darkGray = Color(0xFF2C3A4B);
  static const Color gray100 = Color(0xFFDADEE3);
  static const Color gray50 = Color(0xFFF6F8FB);
  static const Color background = Color(0xFFF4F6F9);

  // Success
  static const Color success = Color(0xFF1EC57A);
  static const Color successLight = Color(0xFF07FF90);
  static const Color successBg = Color(0xFFD9FFED);

  // Warning
  static const Color warning = Color(0xFFFFB800);
  static const Color warningLight = Color(0xFFFFDA7B);

  // Status
  static const Color statusSuccess = Color(0xFF23A757);
  static const Color statusInfo = Color(0xFF2E5AAC);
  static const Color statusError = Color(0xFFDA1414);

  // Reuse
  static const Color green = statusSuccess;
  static const Color yellow = warning;
}
