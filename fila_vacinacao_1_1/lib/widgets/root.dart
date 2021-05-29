import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/login_page.dart';
import 'package:fila_vacinacao_1_1/pages/start_page.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

UserModel userShared;

void loadUser() async {
  userShared = await Users().getuser();
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _user = Provider.of<UserModel>(context);

    return (_user != null && userShared == null) ? StartPage() : LoginPage();
  }
}
