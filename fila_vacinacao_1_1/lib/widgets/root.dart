import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/login_page.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _user = Provider.of<UserModel>(context);
    return (_user != null) ? WidgetTab() : LoginPage();
  }
}
