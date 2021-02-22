import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/DistanciaTiempo.dart';
import 'SelectorEntero.dart';

class SelectorTiempoRepeticion extends StatelessWidget {
  final DistanciaTiempo _tiempo = DistanciaTiempo();
  final Function(DistanciaTiempo) onChange;

  SelectorTiempoRepeticion({this.onChange});

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectorEntero(
          minValue: 0,
          maxValue: 24,
          valActual: 0,
          onChanged: (val) {
            _tiempo.horas = val;
            onChange(_tiempo);
          },
          trailing: Text("horas"),
        ),
        SelectorEntero(
          minValue: 0,
          maxValue: 31,
          valActual: 0,
          onChanged: (val) {
            _tiempo.dias = val;
            onChange(_tiempo);
          },
          trailing: Text("dias"),
        ),
        SelectorEntero(
          minValue: 0,
          maxValue: 12,
          valActual: 0,
          onChanged: (val) {
            _tiempo.meses = val;
            onChange(_tiempo);
          },
          trailing: Text("meses"),
        ),
      ],
    );
  }
}
