import './provider/users.dart';

import '../widgets/widget_tab.dart';
import '../routes/app_routes.dart';
import '../pages/info_page.dart';
import '../pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/settings_page.dart';

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
        ChangeNotifierProvider(
          create: (ctx) => new Users(),
        ),
      ],
      child: MaterialApp(
        darkTheme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.LOGIN_PAGE: (_) => LoginPage(),
          AppRoutes.WIDGET_TAB: (_) => WidgetTab(),
          AppRoutes.INFO_PAGE: (_) => InfoPage(),
        },
      ),
    );
  }
}
