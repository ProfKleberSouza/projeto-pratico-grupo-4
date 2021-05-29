import 'dart:async';
import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_agendado.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_disponivel.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_not_avaible.dart';
import 'package:fila_vacinacao_1_1/widgets/widget_status.dart';
import 'package:flutter/material.dart';
import '../provider/acess_shared_pre.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final _streamControler = StreamController<UserModel>();

  UserModel user;
  FontModel font;
  void loadUser() async {
    user = await Users().getuser();
    setState(() {
      _streamControler.add(user);
    });
  }

  void loadFont() async {
    font = await Acessibilidade().getFontModel();
  }

  _body() {
    return StreamBuilder(
        stream: _streamControler.stream,
        builder: (context, snapshot) {
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
          return SingleChildScrollView(
            child: Column(
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
                              user.nome,
                              style: TextStyle(
                                  fontSize: Acessibilidade().fontSize(font)),
                            ),
                          ),
                          subtitle: Center(
                            child: Text("Prioridade : ${user.prioridade}",
                                style: TextStyle(
                                    fontSize: Acessibilidade().fontSize(font),
                                    color: Colors.deepPurple[900])),
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
                SizedBox(
                  height: 70,
                ),
                if (user.primeiraAplicacao == false &&
                    user.segundaAplicacao == false &&
                    user.agendado == true)
                  WidgetStatus(
                      verifyPrimeiraDose: Colors.red,
                      verifySegundaDose: Colors.red),
                if (user.primeiraAplicacao == true &&
                    user.segundaAplicacao == false &&
                    user.agendado == true)
                  WidgetStatus(
                      verifyPrimeiraDose: Colors.green,
                      verifySegundaDose: Colors.red),
                if (user.primeiraAplicacao == true &&
                    user.segundaAplicacao == true &&
                    user.agendado == true)
                  WidgetStatus(
                      verifyPrimeiraDose: Colors.green,
                      verifySegundaDose: Colors.green),
                if (!user.agendado &&
                    !(user.primeiraAplicacao && user.segundaAplicacao))
                  WidgetAvaible(),
                if (user.primeiraAplicacao &&
                    user.segundaAplicacao &&
                    !user.agendado) //Nao disponivel
                  WidgetNotAvaible(),
                if (user.agendado &&
                    !(user.primeiraAplicacao && user.segundaAplicacao))
                  //Agendado
                  WidgetAgendado(),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    loadFont();
    return Scaffold(
      body: _body(),
    );
  }
}
