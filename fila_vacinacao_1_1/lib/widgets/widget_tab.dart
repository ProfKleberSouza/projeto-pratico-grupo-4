import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';

import '../pages/info_page.dart';
import '../pages/status_page.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class WidgetTab extends StatefulWidget {
  @override
  _WidgetTabState createState() => _WidgetTabState();
}

class _WidgetTabState extends State<WidgetTab> {
  UserModel user;
  loadUser() async {
    user = await Users().getuser();
  }

  int _selectScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Status Agendamentos',
      'screen': StatusPage(),
    },
    {
      'title': 'Informações do usuário',
      'screen': InfoPage(),
    },
    {
      'title': 'Configurações',
      'screen': SettingsPage(),
    }
  ];

  _selectScrenn(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  _body() {
    return FutureBuilder(
        future: loadUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            print("${snapshot.error}");
          }
          return _screens[_selectScreenIndex]['screen'];
        });
  }

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectScreenIndex]['title']),
      ),
      body: _body(), //_screens[_selectScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectScrenn,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectScreenIndex,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Usuário',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
