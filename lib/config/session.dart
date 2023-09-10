import 'dart:convert';

import 'package:get/get.dart';
import 'package:money_record/data/model/user.dart';
import 'package:money_record/presentation/controller/c_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const String USER_KEY = 'user';
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringuser = jsonEncode(mapUser);
    bool success = await pref.setString(USER_KEY, stringuser);
    if (success) {
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
      return success;
  }

  static Future<User> getUser() async {
    User user = User();
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString(USER_KEY);
    if (stringUser != null) {
      Map<String, dynamic> mapuser = jsonDecode(stringUser);
      user = User.fromJson(mapuser);
    }
    final cUser = Get.put(CUser());
    cUser.setData(user);
    return user;
  }
  
  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove(USER_KEY);
    final cUser = Get.put(CUser());
    cUser.setData(User());
    return success;
  }
}
