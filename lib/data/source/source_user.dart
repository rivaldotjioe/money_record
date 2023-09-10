import 'package:d_info/d_info.dart';
import 'package:money_record/config/Api.dart';
import 'package:money_record/config/app_request.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/data/model/standard_response.dart';
import 'package:money_record/data/model/user.dart';
import 'dart:developer' as developer;

class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });
    if (responseBody == null) return false;
    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }
    return responseBody['success'];
  }

  static Future<StandardResponse?> register(
      String name, String email, String password) async {
    String url = '${Api.user}/register.php';
    Map data = {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };
    Map? responseBody = await AppRequest.post(url, data);
    if (responseBody == null) return null;
    if (responseBody['success']) {
      Session.saveUser(User.fromJson(data));
      developer.log('Berhasil Register');
    } else {
      if (responseBody['message'] == 'email') {
        developer.log('email sudah terdaftar');
      } else {
        developer.log('Gagal Register');
      }
    }
    return StandardResponse.fromJson(responseBody);
  }
}
