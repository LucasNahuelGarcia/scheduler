import 'package:flutter/material.dart';

class Fecha extends StatelessWidget {
  final DateTime _date;

  Fecha(this._date);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          _diferenciaDeTiempoDescriptiva(_date),
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          "${_date.day}/${_date.month}",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  String _diferenciaDeTiempoDescriptiva(DateTime fecha) {
    String res;
    int difEnYears = fecha.year - DateTime.now().year;
    int difEnMeses = fecha.month - DateTime.now().month;
    int difEnDias = fecha.day - DateTime.now().day;

    if (difEnYears != 0)
      res = "En $difEnYears años";
    else if (difEnMeses != 0)
      res = "En $difEnMeses meses";
    else if (difEnDias != 0) {
      if (difEnDias == 1)
        res = "Mañana";
      else if (difEnDias == 2)
        res = "Pasado";
      else
        res = "En $difEnDias días";
    } else
      res = "Hoy";

    return res;
  }
}
