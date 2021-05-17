import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/provider/preferences_const.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';
import 'package:fila_vacinacao_1_1/routes/app_routes.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum Scheduling { available, not_avaible, scheduled }

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final String url = 'https://fila-vacina-api.azurewebsites.net/api/User?';
  Scheduling scheduling = Scheduling.not_avaible;
  var _snapshots = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance;
  UserModel user;
  bool expand = false;
  var prioridadeJson;
  Scheduling status() {
    Users().stateAgendamento(scheduling).then((value) => scheduling = value);
    return scheduling;
  }

  UserModel loadUser() {
    Users().getuser().then((value) => user = value);
    return user;
  }

  String nome;
  String name() {
    Users().nameUser().then((value) => nome = value);
    return nome;
  }

  Future<void> prioridade() async {
    UserModel userTemp = await Users().getuser();

    var uri = Uri.parse(url +
        "profissao=${userTemp.profissao}&datadenascimento=${userTemp.datadenascimento}");

    final response = await http.get(uri);
    print(response.body);
    this.prioridadeJson = json.decode(response.body);
    print(this.prioridadeJson);
  }

  @override
  void initState() {
    name();

    prioridade();
    setState(() {
      scheduling = status();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = loadUser();

    setState(() {
      scheduling = status();
    });
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _snapshots
            .collection('usuarios')
            .doc(_user.currentUser.uid)
            .collection('vacinacao')
            .doc(_user.currentUser.uid)
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<DocumentSnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var item = snapshot.data.data();

          return Column(
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
                            name(),
                            style: TextStyle(fontSize: 27),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(item['prioridade'],
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
              if (item['primeiraDose'] == false &&
                  item['segundaDose'] == false &&
                  scheduling == Scheduling.scheduled)
                WidgetStatus(
                    verifyPrimeiraDose: Colors.red,
                    verifySegundaDose: Colors.red),
              if (item['primeiraDose'] == true &&
                  item['segundaDose'] == false &&
                  scheduling == Scheduling.scheduled)
                WidgetStatus(
                    verifyPrimeiraDose: Colors.green,
                    verifySegundaDose: Colors.red),
              if (item['primeiraDose'] == true &&
                  item['segundaDose'] == true &&
                  scheduling == Scheduling.scheduled)
                WidgetStatus(
                    verifyPrimeiraDose: Colors.green,
                    verifySegundaDose: Colors.green),
              if ((scheduling == Scheduling.available &&
                          item['primeiraDose'] == false &&
                          item['segundaDose'] == false ||
                      item['primeiraDose'] == true &&
                          item['segundaDose'] == false) &&
                  scheduling != Scheduling.scheduled) //Marcacao disponivel
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
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
                          child: Container(
                            width: 150,
                            height: 55,
                            child: ElevatedButton(
                              child: Text(
                                "Agendar",
                                style: TextStyle(fontSize: 26),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.AGENDAMENTO_PAGE,
                                    arguments: Scheduling);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (scheduling == Scheduling.not_avaible ||
                  item['primeiraDose'] == true &&
                      item['segundaDose'] == true &&
                      scheduling != Scheduling.scheduled) //Nao disponivel
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
                //Agendado
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 15, left: 15),
                  child: SizedBox(
                    height: expand ? 175 : 65,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.yellowAccent,
                      child: ListView(
                        children: [
                          ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                expand = !isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text(
                                      "${user.dataAgendadaPrimeiraDose}",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  );
                                },
                                body: ListTile(
                                  title: Text(
                                    '1-Dose ,${item['nomeVacina']}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  subtitle: Text(
                                    'Para desmarcar o agendamento clique ao lado',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.close_sharp,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Deseja cancelar o agendamento ?",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Não',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          scheduling =
                                                              Scheduling
                                                                  .available;
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Sim',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ),
                                isExpanded: expand,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
