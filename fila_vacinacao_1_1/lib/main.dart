import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/agendamentos_page.dart';
import 'package:fila_vacinacao_1_1/pages/status_page.dart';
import 'package:fila_vacinacao_1_1/widgets/root.dart';
import '../services/auth.dart';

import './provider/users.dart';

import '../widgets/widget_tab.dart';
import '../routes/app_routes.dart';
import '../pages/info_page.dart';
import '../pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(
          value: Auth().user,
          initialData: null,
        ),
        ChangeNotifierProvider<UserProvider>(
            create: (ctx) => new UserProvider()),
      ],
      child: MaterialApp(
        darkTheme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.ROOT_PAGE: (_) => Root(),
          AppRoutes.LOGIN_PAGE: (_) => LoginPage(),
          AppRoutes.WIDGET_TAB: (_) => WidgetTab(),
          AppRoutes.INFO_PAGE: (_) => InfoPage(),
          AppRoutes.AGENDAMENTO_PAGE: (_) => AgendamentoPage(),
          AppRoutes.STATUS_PAGE: (_) => StatusPage(),
        },
      ),
    );
  }
}
