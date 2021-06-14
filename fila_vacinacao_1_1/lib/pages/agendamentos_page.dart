import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  final StreamController streamController = StreamController<DateTime>();

  var _snapshots = FirebaseFirestore.instance;
  UserModel user;
  String horarioMarcado = "";
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Map<String, dynamic> dateMap;
  var dates;
  String key;
  List<dynamic> horas;
  DateTime _selectedDate;
  var _db = FirebaseDatabase().reference();

  void _resetSelectDate() async {
    await _db.child('datas').once().then((data) => dates = data.value);
    dateMap = json.decode(json.encode(dates));
    _selectedDate = DateTime.parse(dateMap.keys.last.toString());
    key = dateFormat.format(_selectedDate);
    horas = json.decode(dateMap[key]);
    streamController.add(_selectedDate);
  }

  loadUser() async {
    user = await Users().getuser();
  }

  saveSharedUser(String data) async {
    user.dataAgendadaPrimeiraDose = data;
    user.agendado = true;
    Users().saveUser(user);
    updateData(data);
  }

  updateData(String data) {
    var _user = FirebaseAuth.instance;
    _user.authStateChanges();
    _snapshots.collection('usuarios').doc(_user.currentUser.uid).update({
      'agendado': true,
      'dataAgendada': data,
    });
  }

  update() {
    _db.child('datas').update({
      '2021-06-01':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-02':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-03':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-05':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-07':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-08':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-09':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-12':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-13':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-14':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-16':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-18':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-20':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-06-25':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-06-26':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-06-27':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-06-29':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-06-30':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-07-01':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-02':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-03':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-05':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-07':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-08':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-09':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-12':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-13':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-14':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-16':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-18':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-20':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-07-25':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-07-26':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-07-27':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-07-29':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-07-30':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-08-01':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-02':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-03':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-05':
          '["12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-07':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-08':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-09':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-12':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-13':
          '["12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-14':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-16':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-18':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-20':
          '["11:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","17:00","18:00"]',
      '2021-08-25':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-08-26':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-08-27':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-08-29':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
      '2021-08-30':
          '["10:30","11:00","12:30","13:00","13:30","14:00","15:00","16:00","16:30","17:00"]',
    });
  }

  @override
  void dispose() {
    _body();
    super.dispose();
  }

  @override
  void initState() {
    _resetSelectDate();
    loadUser();
    initializeDateFormatting('pt_BR');
    //update();
    super.initState();
  }

  _body() {
    return StreamBuilder(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            print("${snapshot.error}");
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Calendário',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        CalendarTimeline(
                          showYears: true,
                          initialDate: _selectedDate,
                          firstDate: DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year + 5),
                          onDateSelected: (date) {
                            if (mounted) {
                              setState(() {
                                _selectedDate = date;
                                key = dateFormat.format(_selectedDate);
                                horas = json.decode(dateMap[key]);
                              });
                            }
                          },
                          leftMargin: 30,
                          monthColor: Colors.black,
                          dayColor: Colors.blue,
                          dayNameColor: Color(0xFF333A47),
                          activeDayColor: Colors.amber,
                          activeBackgroundDayColor: Colors.green[50],
                          dotsColor: Color(0xFF333A47),
                          selectableDayPredicate: (date) =>
                              dateMap.containsKey(dateFormat.format(date)),
                          locale: 'pt',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (horarioMarcado != "")
                              Container(
                                height: 57,
                                width: 220,
                                child: ElevatedButton(
                                  onPressed: () {
                                    saveSharedUser(DateFormat(" dd/MM/yy")
                                            .format(_selectedDate)
                                            .toString() +
                                        ' ' +
                                        horarioMarcado);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    DateFormat("'Agendar :' dd/MM/yy ")
                                            .format(_selectedDate) +
                                        horarioMarcado,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            Container(
                              height: 50,
                              width: 125,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Voltar',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red[200]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    elevation: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: Card(
                    elevation: 3,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: horas.length,
                      itemBuilder: (BuildContext contexte, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            color: Colors.teal[50],
                            child: TextButton(
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    horarioMarcado = '${horas[index]}';
                                  });
                                }
                              },
                              child: Text(
                                '${horas[index]}',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.blue),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
