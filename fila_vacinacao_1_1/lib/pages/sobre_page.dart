import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Divider(
              height: 60,
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: Text(
                  "Este aplicativo tem a finalidade de gerenciar o agendamento para a vacinação contra a COVID-19.",
                  style: TextStyle(fontSize: 24)),
            ),
            Divider(),
            Container(
              height: 80,
              width: double.infinity,
              child: Text(
                "Versão 0.1",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Divider(),
            Container(
              height: 80,
              width: double.infinity,
              child: Text(
                "Desenvolvedores:Pedro Augusto , Pedro Henrique , Ian Rafael.",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Divider(),
            Container(
              height: 80,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
