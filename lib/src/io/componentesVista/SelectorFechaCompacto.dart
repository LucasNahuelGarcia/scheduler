import 'package:flutter/material.dart';

class SelectorFechaCompacto extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  SelectorFechaCompacto({@required this.onDateChanged});
  @override
  State<StatefulWidget> createState() {
    return _StateSelectorFechaCompacto(onDateChanged: onDateChanged);
  }
}

class _StateSelectorFechaCompacto extends State<SelectorFechaCompacto> {
  DateTime _date = DateTime.now();
  final Function(DateTime) onDateChanged;
  _StateSelectorFechaCompacto({@required this.onDateChanged});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "${_date.day}/${_date.month}/${_date.year}",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        _date = await showDatePicker(
              context: context,
              initialDate: _date,
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 100),
            ) ??
            _date;
        setState(() {});
        onDateChanged(_date ?? DateTime.now());
      },
    );
  }
}
