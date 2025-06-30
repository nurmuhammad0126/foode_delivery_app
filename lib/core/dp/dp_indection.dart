import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_for_uicgroup/core/dio_client/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setUpLocator() async {
  getIt.registerSingleton<DioClient>(DioClient());

  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);
  
}
