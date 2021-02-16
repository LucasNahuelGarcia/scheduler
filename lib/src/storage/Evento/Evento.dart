import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/RepeticionEvento.dart';

enum TipoDeEvento {
  Periodico,
  UnaVez,
}

class Evento {
  DateTime fecha;
  String titulo;

  RepeticionEvento repeticionEvento;

  Evento({this.fecha, this.titulo, this.repeticionEvento});
}
