import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/status_page.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class WidgetAgendado extends StatefulWidget {
  @override
  WidgetAgendado();
  _WidgetAgendadoState createState() => _WidgetAgendadoState();
}

class _WidgetAgendadoState extends State<WidgetAgendado> {
  FontModel font;
  var _snapshots = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance;
  bool expand = false;
  UserModel user;
  void updateData(String data) {
    var _user = FirebaseAuth.instance;
    _user.authStateChanges();
    _snapshots.collection('usuarios').doc(_user.currentUser.uid).update({
      'agendado': false,
      'dataAgendada': data,
    });
  }

  void loadUser() async {
    user = await Users().getuser();
    font = await Acessibilidade().getFontModel();
  }

  double tamExpansionPainel() {
    double tam = Acessibilidade().fontSize(font);
    if (tam == 14.0 && expand) {
      return 155.0;
    } else if (tam == 17.0 && expand) {
      return 166.0;
    } else if (tam == 24.0 && expand) {
      return 217.0;
    } else if (!expand) {
      return 65.0;
    }
    return 65.0;
  }

  @override
  Widget build(BuildContext context) {
    loadUser();
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
          stream: _snapshots
              .collection('usuarios')
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
            return Padding(
              padding: const EdgeInsets.only(top: 22, right: 15, left: 15),
              child: SizedBox(
                height: tamExpansionPainel(), //expand ? 218 : 65,
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
                                  "Data Agendada",
                                  style: TextStyle(
                                      fontSize:
                                          Acessibilidade().fontSize(font)),
                                ),
                              );
                            },
                            body: ListTile(
                              title: Text(
                                "${user.dataAgendadaPrimeiraDose}",
                                style: TextStyle(
                                    fontSize: Acessibilidade().fontSize(font)),
                              ),
                              subtitle: Text(
                                'Para desmarcar o agendamento clique ao lado',
                                style: TextStyle(
                                    fontSize: Acessibilidade().fontSize(font)),
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
                                            style: TextStyle(
                                                fontSize: Acessibilidade()
                                                    .fontSize(font)),
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
                                                        fontSize:
                                                            Acessibilidade()
                                                                .fontSize(font),
                                                        color: Colors.green),
                                                  ),
                                                ),
                                                OutlinedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      user.agendado = false;

                                                      user.dataAgendadaPrimeiraDose =
                                                          ' ';
                                                      Users().saveUser(user);
                                                      updateData(' ');
                                                      StatusPage();
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Sim',
                                                    style: TextStyle(
                                                        fontSize:
                                                            Acessibilidade()
                                                                .fontSize(font),
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
            );
          }),
    );
  }
}
