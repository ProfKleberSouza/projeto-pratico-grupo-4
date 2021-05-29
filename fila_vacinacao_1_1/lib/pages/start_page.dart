import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'dart:convert';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';

import 'package:fila_vacinacao_1_1/widgets/widget_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final String url = 'https://fila-vacina-api.azurewebsites.net/api/User?';
  var _snapshots = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance;

  void prioridade() async {
    UserModel userTemp = await Users().getuser();
    var uri = Uri.parse(url +
        "profissao=${userTemp.setor}&datadenascimento=${userTemp.datadenascimento}");
    final response = await http.get(uri);
    if (response.body.isNotEmpty) {
      userTemp.prioridade = json.decode(response.body);
      updateData();
      print(userTemp.prioridade);
    }
  }

  void updateData() async {
    UserModel userTemp = await Users().getuser();
    var _user = FirebaseAuth.instance;
    _user.authStateChanges();
    _snapshots.collection('usuarios').doc(_user.currentUser.uid).update({
      'prioridade': userTemp.prioridade,
    });
  }

  @override
  void initState() {
    //prioridade();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: _snapshots
              .collection('usuarios')
              .doc(_user.currentUser.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
            if (snapshot.hasData) {
              Future.delayed(
                  Duration(seconds: 2), () => CircularProgressIndicator);
            }
            var item = snapshot.data.data();
            FontModel _fontelog = FontModel(tamfonte: item['font']);

            UserModel _userlog = UserModel(
                nome: item['nome'],
                sexo: item['sexo'],
                cep: item['cep'],
                cpf: item['cpf'],
                datadenascimento: item['datadenascimento'],
                email: item['email'],
                fone: item['fone'],
                numero: item['numero'],
                setor: item['setor'],
                agendado: item['agendado'],
                endereco: item['endereco'],
                primeiraAplicacao: item['primeiraDose'],
                segundaAplicacao: item['segundaDose'],
                prioridade: item['prioridade'],
                dataAgendadaPrimeiraDose: item['dataAgendada']);

            Acessibilidade().setFontAcess(_fontelog);
            Users().saveUser(_userlog);

            return WidgetTab();
          }),
    );
  }
}
