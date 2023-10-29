import 'dart:convert';

import 'package:jobspot/injection.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  PrefsUtils._();

  static SharedPreferences get prefs => getIt<SharedPreferences>();

  static bool get isRemember => prefs.getBool("isRemember") ?? false;

  static Future setIsRemember(bool value) async =>
      await prefs.setBool("isRemember", value);

  static String? get email => prefs.getString("email");

  static String? get password => prefs.getString("password");

  static Future setRemember({
    required String email,
    required String password,
  }) async {
    await setIsRemember(true);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  static Future removeRemember() async {
    await setIsRemember(false);
    await prefs.remove("email");
    await prefs.remove("password");
  }

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
