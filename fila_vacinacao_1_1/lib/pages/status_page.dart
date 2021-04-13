import 'package:fila_vacinacao_1_1/routes/app_routes.dart';
import 'package:flutter/material.dart';

enum Scheduling { available, not_avaible, scheduled }

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Scheduling scheduling = Scheduling.available;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Fulano',
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    subtitle: Center(
                      child: Text('Prioridade: Grupo 5',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple[900])),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  maxRadius: 50,
                ),
              ),
            ],
          ),
          if (scheduling == Scheduling.available)
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.greenAccent,
                  child: ListTile(
                    title: Text(
                      "Agendamento Disponível",
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Center(
                      child: ElevatedButton(
                        child: Text(
                          "Agendar",
                          style: TextStyle(fontSize: 26),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.AGENDAMENTO_PAGE);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (scheduling == Scheduling.not_avaible)
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.redAccent,
                  child: ListTile(
                    title: Text(
                      "Agendamento não disponível",
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Center(
                      child: Icon(
                        Icons.remove_circle_outline_sharp,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (scheduling == Scheduling.scheduled)
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.yellowAccent,
                  child: ListTile(
                    title: Text(
                      "Data Agendada : 12/07/2021 - 12:30 - Terça-feira",
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Center(
                      child: ElevatedButton(
                        child: Text(
                          "Detalhes",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
