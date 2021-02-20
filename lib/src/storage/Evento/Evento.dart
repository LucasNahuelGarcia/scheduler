import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/EventBehaviour.dart';

enum TipoDeEvento {
  Periodico,
  UnaVez,
}

class Evento {
  String titulo;
  int importancia;
  List<String> notas;

  EventBehaviour eventBehaviour;

  Evento({
    @required this.titulo,
    @required this.eventBehaviour,
    @required this.importancia,
    this.notas,
  });
}
