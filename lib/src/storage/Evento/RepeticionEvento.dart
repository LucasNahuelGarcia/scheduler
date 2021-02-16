import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class RepeticionEvento {
  final Duration periodo;

  RepeticionEvento(this.periodo);

  void accion(Evento e) {
    if (periodo.inSeconds == 0)
      StorageManager.instancia.removeEvento(e);
    else
      e.fecha = e.fecha.add(periodo);
  }
}
