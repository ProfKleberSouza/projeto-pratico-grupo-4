import 'dart:convert';

import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/provider/preferences_const.dart';
import "package:shared_preferences/shared_preferences.dart";

class Acessibilidade {
  void setFontAcess(FontModel font) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.acessSaved, json.encode(font.toJson()));
  }

  Future<FontModel> getFontModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonFont = prefs.getString(PreferencesKeys.acessSaved);
    var mapFont = json.decode(jsonFont);
    FontModel font = FontModel.fromJson(mapFont);
    return font;
  }

  double fontSize(FontModel font) {
    if (font.tamfonte == '14.0') {
      return 14.0;
    } else if (font.tamfonte == '17.0') {
      return 17.0;
    } else if (font.tamfonte == '24.0') {
      return 24.0;
    }
    return null;
  }
}
