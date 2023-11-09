import 'dart:convert';

import 'package:jobspot/injection.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  PrefsUtils._();

  static SharedPreferences get prefs => getIt<SharedPreferences>();

  static bool get isNotification => prefs.getBool("isNotification") ?? true;

  static Future setIsNotification(bool value) async =>
      await prefs.setBool("isNotification", value);

  static Future removeNotification() async =>
      await prefs.remove("isNotification");

  static bool get isRemember => prefs.getBool("isRemember") ?? false;

  static Future setIsRemember(bool value) async =>
      await prefs.setBool("isRemember", value);

  static String? get email => prefs.getString("email");

  static String? get password => prefs.getString("password");

  static Future setRemember({
    required String email,
    required String password,
  }) async =>
      await Future.wait([
        setIsRemember(true),
        prefs.setString("email", email),
        prefs.setString("password", password),
      ]);

  static Future removeRemember() async => await Future.wait([
        setIsRemember(false),
        prefs.remove("email"),
        prefs.remove("password"),
      ]);

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
