import 'dart:convert';

import 'package:jobspot/injection.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  PrefsUtils._();

  static SharedPreferences get prefs => getIt<SharedPreferences>();

  static bool get isFirstOpen => prefs.getBool("first_open") ?? false;

  static Future openedApp() async => await prefs.setBool("first_open", true);

  static bool? get isVietnamese => prefs.getBool("language");

  static Future setLanguage(bool value) async =>
      await prefs.setBool("language", value);

  static Future saveUserInfo(Map<String, dynamic> data) async =>
      await prefs.setString("user", jsonEncode(data));

  static UserEntity? getUserInfo() {
    String? data = prefs.getString("user");
    if (data != null) {
      return UserModel.fromJson(jsonDecode(data)).toUserEntity();
    }
    return null;
  }

  static Future removeUserInfo() async => await prefs.remove("user");
}
