import 'dart:convert';

import 'package:jobspot/injection.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  PrefsUtils._();

  static SharedPreferences get prefs => getIt<SharedPreferences>();

  static Future saveUserInfo(Map<String, dynamic> data) async =>
      await prefs.setString("user", jsonEncode(data));

  static UserModel? getUserInfo() {
    String? data = prefs.getString("user");
    if (data != null) {
      return UserModel.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future removeUserInfo() async => await prefs.remove("user");
}
