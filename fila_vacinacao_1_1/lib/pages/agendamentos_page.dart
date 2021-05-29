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
  final _streamControllerAgendamentos = StreamController<List<dynamic>>();
  var _snapshots = FirebaseFirestore.instance;
  UserModel user;
  String horarioMarcado = "";
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Map<String, dynamic> dateMap = {};
  DateTime _selectedDate;
  Map<Object, Object> dates = {};
  List<String> horas;

  String jsonString;
  //   '{"2021-05-14": ["12:30","13:00", "13:30", "14:00", "14:30", "15:00"],"2021-05-16": ["12:30", "13:00", "13:30", "14:00", "14:30", "15:00"]  }';

  loadDataHora() async {
    var _db = FirebaseDatabase().reference();
    var dadosDB = _db.reference().child('datas').orderByValue();
    await dadosDB.once().then((DataSnapshot data) => dates = data.value);

    // dates.forEach((key, value) {
    //    horas = (value as List)?.map((e) => e as String)?.toList();
    // });

    jsonString = json.encode(dates);
    print(jsonString);
    _streamControllerAgendamentos.add(horas);
  }

  void loadUser() async {
    user = await Users().getuser();
  }

  void saveSharedUser(String data) async {
    user.dataAgendadaPrimeiraDose = data;
    user.agendado = true;
    Users().saveUser(user);
    updateData(data);
  }

  void updateData(String data) {
    var _user = FirebaseAuth.instance;
    _user.authStateChanges();
    _snapshots.collection('usuarios').doc(_user.currentUser.uid).update({
      'agendado': true,
      'dataAgendada': data,
    });
  }

  @override
  void initState() {
    loadDataHora();
    loadUser();
    initializeDateFormatting('pt_BR');
    dateMap = json.decode(jsonString);
    print(dateMap);
    dateMap.forEach((key, value) {
      horas = (value as List)?.map((e) => e as String)?.toList();
      print(horas);
    });
    _selectedDate = DateTime.parse(dateMap.keys.first);
    super.initState();
  }

  _body() {
    return StreamBuilder(
        stream: _streamControllerAgendamentos.stream,
        builder: (BuildContext context, snapshot) {
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
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Container(
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
                            setState(() {
                              _selectedDate = date;
                            });
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
                                    setState(() {
                                      saveSharedUser(DateFormat(" dd/MM/yy")
                                              .format(_selectedDate)
                                              .toString() +
                                          ' ' +
                                          horarioMarcado);
                                    });

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
                                  Navigator.pop(context);
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
                Card(
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
                              setState(() {
                                horarioMarcado = '${horas[index]}';
                              });
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
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}
