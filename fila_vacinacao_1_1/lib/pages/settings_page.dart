import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 90,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  children: [
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: Auth().singOut,
                      icon: Icon(Icons.exit_to_app),
                      iconSize: 36,
                    ),
                    Text(
                      'Sair',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
