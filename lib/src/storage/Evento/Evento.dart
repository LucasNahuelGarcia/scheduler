import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/EventBehaviour.dart';

enum TipoDeEvento {
  Periodico,
  UnaVez,
}

class Evento {
  String titulo = "evento sin titulo";
  int importancia = 0;

  EventBehaviour eventBehaviour;

  Evento({
    @required this.titulo,
    @required this.eventBehaviour,
    @required this.importancia,
  });
}
