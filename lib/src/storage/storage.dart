import 'package:flutter/material.dart';

import 'Evento/Evento.dart';

class StorageManager extends ChangeNotifier {
  final List<Evento> _eventos = new List();
  List<Evento> get eventos => _eventos;

  void addEvento(Evento evento) {
    _eventos.add(evento);
    notifyListeners();
  }

  void removeEvento(Evento evento) {
    _eventos.remove(evento);
    notifyListeners();
  }
}
