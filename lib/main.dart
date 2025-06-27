import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import 'features/profile/presentation/pages/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);
    return MaterialApp(home: ProfileScreen());
  }
}
