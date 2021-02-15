import 'package:flutter/material.dart';

import 'Evento.dart';

class StorageManager extends ChangeNotifier {
  static StorageManager _instancia;

  StorageManager._() {
    if (_instancia == null)
      _instancia = this;
    else
      this.dispose();
  }

  static StorageManager get instancia {
    if (_instancia == null) _instancia = new StorageManager._();

    return _instancia;
  }

  final List<Evento> _eventos = new List();
  List<Evento> get eventos => _eventos;

  void addEvento(Evento evento) {
    _eventos.add(evento);
    notifyListeners();
  }

  void deleteEvento(Evento evento) {
    _eventos.remove(evento);
    notifyListeners();
  }
}
