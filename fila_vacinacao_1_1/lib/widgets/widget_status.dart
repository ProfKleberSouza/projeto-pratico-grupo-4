import 'package:fila_vacinacao_1_1/models/font.dart';
import 'package:fila_vacinacao_1_1/provider/acess_shared_pre.dart';
import 'package:flutter/material.dart';

class WidgetStatus extends StatefulWidget {
  final Color verifyPrimeiraDose;
  final Color verifySegundaDose;

  WidgetStatus({this.verifyPrimeiraDose, this.verifySegundaDose});

  @override
  _WidgetStatusState createState() => _WidgetStatusState();
}

class _WidgetStatusState extends State<WidgetStatus> {
  @override
  void initState() {
    loadFont();
    super.initState();
  }

  FontModel font;
  loadFont() async {
    await Acessibilidade().getFontModel().then((value) => font = value);
  }

  _card() {
    return FutureBuilder(
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
            padding: const EdgeInsets.all(11),
            child: Card(
              child: Container(
                width: 380,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Primeira Dose',
                          style: TextStyle(
                              fontSize: Acessibilidade().fontSize(font)),
                        ),
                        if (widget.verifyPrimeiraDose == Colors.red)
                          Icon(
                            Icons.cancel_sharp,
                            size: 36,
                            color: widget.verifyPrimeiraDose,
                          ),
                        if (widget.verifyPrimeiraDose == Colors.green)
                          Icon(
                            Icons.check_circle,
                            size: 36,
                            color: widget.verifyPrimeiraDose,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Segunda Dose',
                          style: TextStyle(
                              fontSize: Acessibilidade().fontSize(font)),
                        ),
                        if (widget.verifySegundaDose == Colors.red)
                          Icon(
                            Icons.cancel_sharp,
                            size: 36,
                            color: widget.verifySegundaDose,
                          ),
                        if (widget.verifySegundaDose == Colors.green)
                          Icon(
                            Icons.check_circle,
                            size: 36,
                            color: widget.verifySegundaDose,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _card();
  }
}
