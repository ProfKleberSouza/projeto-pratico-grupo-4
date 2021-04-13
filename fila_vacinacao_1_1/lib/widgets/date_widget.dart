import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

DateTime _selectedDate = DateTime.now();

class _DatePickerState extends State<DatePicker> {
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          firstDate: DateTime(DateTime.now().year - 1),
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
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'pt',
        ),
      ],
    );
  }
}
