import 'dart:convert';

import 'package:fila_vacinacao_1_1/models/user.dart';

import 'package:fila_vacinacao_1_1/provider/preferences_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  void saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.savedUser, jsonEncode(user.toJson()));
  }

  Future<UserModel> getuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = prefs.getString(PreferencesKeys.savedUser);
    Map<String, dynamic> mapUser = json.decode(jsonUser);
    UserModel user = UserModel.fromJson(mapUser);
    return user;
  }

  void clearUser() async {
    UserModel user = UserModel();

    saveUser(user);
  }
}
