import 'dart:convert';

import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/status_page.dart';
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

  Future<String> nameUser() async {
    UserModel user = await Users().getuser();
    return user.nome;
  }

  void clearUser() async {
    UserModel user = UserModel(nome: 'nao logado');

    saveUser(user);
  }

  Future<Scheduling> stateAgendamento(Scheduling scheduling) async {
    UserModel temp = await Users().getuser();
    if (temp.agendado) {
      scheduling = Scheduling.scheduled;
    } else {
      scheduling = Scheduling.available;
    }
    return scheduling;
  }
}
