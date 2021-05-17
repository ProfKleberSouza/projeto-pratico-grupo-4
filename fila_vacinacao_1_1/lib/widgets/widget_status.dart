import 'package:flutter/material.dart';

class WidgetStatus extends StatefulWidget {
  final Color verifyPrimeiraDose;
  final Color verifySegundaDose;

  WidgetStatus({Color this.verifyPrimeiraDose, Color this.verifySegundaDose});

  @override
  _WidgetStatusState createState() => _WidgetStatusState();
}

class _WidgetStatusState extends State<WidgetStatus> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  style: TextStyle(fontSize: 26),
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
                  style: TextStyle(fontSize: 26),
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
    );
  }
}
