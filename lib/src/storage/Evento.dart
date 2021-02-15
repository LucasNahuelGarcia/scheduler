enum TipoDeEvento {
  Periodico,
  UnaVez,
}

class Evento {
  DateTime fecha;
  String titulo;

  Evento({this.fecha, this.titulo});
}
