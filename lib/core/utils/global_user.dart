import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';

UserModel? globalUser;

void setGlobalUser(UserModel user) {
  globalUser = user;
}

void updateGlobalUser({
  DateTime? createdAt,
  String? email,
  Map<String, bool>? likedMeals,
  Locationn? location,
  String? name,
  String? photoUrl,
  Map<String, bool>? savedRestaurants,
  String? userName,
  String? adress,
  String? phoneNumber,
}) {
  if (globalUser != null) {
    globalUser = globalUser!.copyWith(
      userName: userName,
      name: name,
      adress: adress,
      phoneNumber: phoneNumber,
      createdAt: createdAt,
      email: email,
      likedMeals: likedMeals,
      location: location,
      photoUrl: photoUrl,
      savedRestaurants: savedRestaurants,
    );
  }
}

UserModel? getGlobalUser() {
  return globalUser;
}
