import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum SelectSizeFont { min, avarage, max }

class AcessPage extends StatefulWidget {
  @override
  _AcessPageState createState() => _AcessPageState();
}

class _AcessPageState extends State<AcessPage> {
  final _streamControllerAcess = StreamController<FontModel>();
  SelectSizeFont _selectSizeFont = SelectSizeFont.min;
  FontModel font;
  void loadFont() async {
    font = await Acessibilidade().getFontModel();
    _streamControllerAcess.add(font);
  }

  void upadateFontSizeData() {
    var _user = FirebaseAuth.instance;
    var _snapshots = FirebaseFirestore.instance;
    _snapshots.collection('usuarios').doc(_user.currentUser.uid).update({
      'font': font.tamfonte,
    });
  }

  void fontSize(SelectSizeFont _selectSizeFont) {
    if (_selectSizeFont == SelectSizeFont.min) {
      font.tamfonte = 14.0.toString();
    } else if (_selectSizeFont == SelectSizeFont.avarage) {
      font.tamfonte = 17.0.toString();
    } else if (_selectSizeFont == SelectSizeFont.max) {
      font.tamfonte = 24.0.toString();
    }
    Acessibilidade().setFontAcess(font);
    upadateFontSizeData();
  }

  @override
  void initState() {
    loadFont();
    super.initState();
  }

  _body() {
    return StreamBuilder(
        stream: _streamControllerAcess.stream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Ajuste no tamanho da Fonte',
                  style: TextStyle(fontSize: 24),
                ),
                Divider(
                  height: 40,
                ),
                ListTile(
                  title: Text(
                    'Ex:A a , 1 2',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Radio(
                    value: SelectSizeFont.min,
                    onChanged: (SelectSizeFont value) {
                      setState(() {
                        _selectSizeFont = value;
                        print(_selectSizeFont);
                      });
                    },
                    groupValue: _selectSizeFont,
                  ),
                ),
                Divider(
                  height: 40,
                ),
                ListTile(
                  title: Text(
                    'Ex:A a , 1 2',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: Radio(
                    value: SelectSizeFont.avarage,
                    onChanged: (SelectSizeFont value) {
                      setState(() {
                        _selectSizeFont = value;
                        print(_selectSizeFont);
                      });
                    },
                    groupValue: _selectSizeFont,
                  ),
                ),
                Divider(
                  height: 40,
                ),
                ListTile(
                  title: Text(
                    'Ex:A a , 1 2',
                    style: TextStyle(fontSize: 24),
                  ),
                  trailing: Radio(
                    value: SelectSizeFont.max,
                    onChanged: (SelectSizeFont value) {
                      setState(() {
                        _selectSizeFont = value;
                        print(_selectSizeFont);
                      });
                    },
                    groupValue: _selectSizeFont,
                  ),
                ),
                Divider(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          fontSize(_selectSizeFont);
                          print(font.tamfonte);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Confirmar',
                        style: TextStyle(fontSize: 24),
                      )),
                ),
                Divider(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: _body(),
    );
  }
}
