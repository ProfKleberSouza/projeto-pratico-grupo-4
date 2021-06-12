import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/pages/agendamentos_page.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';

import 'package:flutter/material.dart';

class WidgetAvaible extends StatefulWidget {
  @override
  _WidgetAvaibleState createState() => _WidgetAvaibleState();
}

class _WidgetAvaibleState extends State<WidgetAvaible> {
  FontModel font;
  loadFont() async {
    await Acessibilidade().getFontModel().then((value) => font = value);
  }

  @override
  void initState() {
    loadFont();
    super.initState();
  }

  _avaible() {
    return Container(
      child: FutureBuilder(
        future: loadFont(),
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

          return Padding(
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
                    style: TextStyle(fontSize: Acessibilidade().fontSize(font)),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Center(
                    child: Container(
                      width: 150,
                      height: 55,
                      child: ElevatedButton(
                        child: Text(
                          "Agendar",
                          style: TextStyle(
                              fontSize: Acessibilidade().fontSize(font)),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () {
                          if (mounted) {
                            setState(() {});
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgendamentoPage()),
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _avaible(); //Marcaçao disponivel
  }
}
