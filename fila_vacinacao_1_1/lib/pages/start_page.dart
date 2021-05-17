import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';

import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';

import 'package:fila_vacinacao_1_1/widgets/widget_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var _snapshots = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance;

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

            var item = snapshot.data.data();
            UserModel _userlog = UserModel(
                nome: item['nome'],
                sexo: item['sexo'],
                cep: item['cep'],
                cpf: item['cpf'],
                datadenascimento: item['datadenascimento'],
                email: item['email'],
                fone: item['fone'],
                numero: item['numero'],
                profissao: item['profissao']);

            Users().saveUser(_userlog);
            return WidgetTab();
          }),
    );
  }
}
