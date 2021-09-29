import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/DistanciaTiempo.dart';

class Evento {
  int id;
  String titulo;
  int importancia;
  List<String> notas;
  List<DateTime> fechas;
  DistanciaTiempo repeticion;

  Evento({
    this.id,
    @required this.titulo,
    @required this.importancia,
    this.fechas,
    this.repeticion,
    this.notas,
  });
}
