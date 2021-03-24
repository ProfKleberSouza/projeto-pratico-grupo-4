import '../pages/info_page.dart';

import '../pages/agendamento_page.dart';

import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class WidgetTab extends StatefulWidget {
  @override
  _WidgetTabState createState() => _WidgetTabState();
}

class _WidgetTabState extends State<WidgetTab> {
  int _selectScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Agendamentos',
      'screen': AgendamentoPage(),
    },
    {
      'title': 'Informações do usuário',
      //'screen': InfoUserPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(_screens[_selectScreenIndex]['title']),
      ),
      body: _screens[_selectScreenIndex]['screen'],
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
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Configuração',
          ),
        ],
      ),
    );
  }
}
