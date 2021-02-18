import 'package:scheduler/src/storage/Evento/EventBehaviour.dart';

enum TipoDeEvento {
  Periodico,
  UnaVez,
}

class Evento {
  String titulo;

  EventBehaviour eventBehaviour;

  Evento({this.titulo, this.eventBehaviour});
}
