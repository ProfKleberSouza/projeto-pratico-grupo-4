import 'package:fila_vacinacao_1_1/widgets/date_widget.dart';
import 'package:flutter/material.dart';

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Card(
                child: DatePicker(),
                elevation: 5,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(380)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox.fromSize(
                      size: (Size.fromWidth(378)),
                      child: ClipRect(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Horario",
                                style: TextStyle(fontSize: 26),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: ElevatedButton(
                  child: Text("Confirmar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green[300]),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
