import 'package:jobspot/src/core/constants/constants.dart';

String? getLocation(int code) => AppLists.provinces
    .firstWhere((element) => (element["code"] as int) == code)["name"];
