import 'package:fila_vacinacao_1_1/models/user.dart';
import 'package:fila_vacinacao_1_1/pages/status_page.dart';
import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';
import 'package:fila_vacinacao_1_1/routes/app_routes.dart';
import 'dart:convert';
import 'status_page.dart';
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
  List<bool> isSelected = List.generate(7, (_) => false);
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Map<String, dynamic> dateMap = {};
  var jsonString =
      '{"2021-05-14": ["12:30", "13:00", "13:30", "14:00", "14:30", "15:00"],"2021-05-16": ["12:30", "13:00", "13:30", "14:00", "14:30", "15:00"]  }';
  var db = FirebaseDatabase().reference();
  DateTime _selectedDate;

  String horarioMarcado = "";

  Map<String, String> horarios = {
    "0": "11:00",
    "1": "12:00",
    "2": "13:00",
    "3": "14:00",
    "4": "15:00",
    "5": "16:00",
    "6": "17:00",
    "7": "18:00",
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR');
    dateMap = json.decode(jsonString);
    _selectedDate = DateTime.parse(dateMap.keys.first);
  }

  void saveData(String data) async {
    UserModel userTemp = await Users().getuser();
    userTemp.dataAgendadaPrimeiraDose = data;
    userTemp.agendado = true;
    Users().saveUser(userTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                                saveData(DateFormat(" dd/MM/yy")
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
            Container(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ToggleButtons(
                    renderBorder: false,
                    verticalDirection: VerticalDirection.down,
                    splashColor: Colors.green[50],
                    disabledColor: Colors.red,
                    color: Colors.green,
                    selectedColor: Colors.amber[600],
                    borderWidth: 1.9,
                    selectedBorderColor: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    direction: Axis.vertical,
                    children: [
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['0']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['1']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['2']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['3']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['4']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['5']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 380,
                        color: Colors.teal[50],
                        child: Text(
                          "${horarios['6']}",
                          //"${horarios['2021-05-14']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                        horarioMarcado = "${horarios[index.toString()]}";
                      });
                    },
                    isSelected: isSelected,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
