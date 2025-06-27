import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

import 'features/orders/presentation/pages/favorite_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtilsExtension.instance.init(context);

    return MaterialApp(home: FavoriteScreen());
  }
}
