import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
<<<<<<< HEAD

import 'features/profile/presentation/pages/profile_screen.dart';
=======
import 'package:task_for_uicgroup/features/orders/presentation/pages/restaurant_profile_screen.dart';
>>>>>>> c9f6aeb5afc3f7f48f0b303d71ca19b11d0a61cd

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);
<<<<<<< HEAD
    return MaterialApp(home: ProfileScreen());
=======
    return MaterialApp(home: RestaurantProfileScreen());
>>>>>>> c9f6aeb5afc3f7f48f0b303d71ca19b11d0a61cd
  }
}
