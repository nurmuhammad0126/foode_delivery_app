import 'package:flutter/widgets.dart';

double height = 1, width = 1, arithmetic = 1;

extension ExtSize on num {
  double get h => this * height;

  double get w => this * width;

  double get o => this * arithmetic;
}

extension Gap on num {
  SizedBox get height => SizedBox(height: h.toDouble());

  SizedBox get width => SizedBox(width: w.toDouble());
}