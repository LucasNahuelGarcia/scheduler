import 'Evento.dart';

final List<Evento> _eventos = new List();

List<Evento> get eventos => _eventos;

void addEvento(Evento evento) {
  _eventos.add(evento);
}
