import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/DistanciaTiempo.dart';

class Evento {
  String titulo;
  int importancia;
  List<String> notas;
  DateTime fecha;
  DistanciaTiempo repeticion;

  Evento({
    @required this.titulo,
    @required this.fecha,
    @required this.importancia,
    this.repeticion,
    this.notas,
  });

  /// Devuelve a lo sumo las proximas n repeticiones del evento.
  List<DateTime> proximosEventos(int cant) {
    List<DateTime> res = new List();
    DateTime proxFecha = fecha;

    if (repeticion != null) {
      while (fecha.compareTo(DateTime.now()) < 0)
        fecha = repeticion.addTo(fecha);

      for (int i = 0; i < cant; i++) {
        res.add(proxFecha);
        proxFecha = repeticion.addTo(proxFecha);
      }
    } else {
      res.add(proxFecha);
    }

    return res;
  }
}
