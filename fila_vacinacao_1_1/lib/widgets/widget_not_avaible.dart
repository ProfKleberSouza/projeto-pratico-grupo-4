import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'package:flutter/material.dart';

class WidgetNotAvaible extends StatefulWidget {
  @override
  _WidgetNotAvaibleState createState() => _WidgetNotAvaibleState();
}

class _WidgetNotAvaibleState extends State<WidgetNotAvaible> {
  FontModel font;
  loadFont() async {
    await Acessibilidade().getFontModel().then((value) => font = value);
  }

  @override
  void initState() {
    loadFont();
    super.initState();
  }

  _notAvaible() {
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
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Card(
                elevation: 8,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: Text(
                    "Agendamento não disponível",
                    style: TextStyle(fontSize: Acessibilidade().fontSize(font)),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Center(
                    child: Icon(
                      Icons.remove_circle_outline_sharp,
                      color: Colors.redAccent,
                      size: 50,
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
    return _notAvaible();
  }
}
