import 'package:flutter/widgets.dart';

double height = 1, width = 1, arithmetic = 1;

extension ExtSize on num {
  double get h => SizeUtilsExtension.instance.screenHeight * this / 812;
  double get w => SizeUtilsExtension.instance.screenWidth * this / 375;
  double get o => ((h + w) / 2);
}

class SizeUtilsExtension {
  static final SizeUtilsExtension instance = SizeUtilsExtension._internal();
  late double screenWidth;
  late double screenHeight;

  SizeUtilsExtension._internal();

  void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
  }
}

extension Gap on num {
  SizedBox get height => SizedBox(height: h.toDouble());

  SizedBox get width => SizedBox(width: w.toDouble());
}
