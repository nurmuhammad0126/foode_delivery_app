import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalRepository {
  final auth = FirebaseAuth.instance;

  Future<void> saveProfileCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('profile_completed', value);
  }

  Future<bool?> isProfileCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('profile_completed');
  }

  Future<void> removeProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_completed');
  }
}
