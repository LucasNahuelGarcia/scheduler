import 'package:scheduler/src/storage/Evento/EventBehaviour.dart';

class EventoFechaUnica extends EventBehaviour {
  DateTime fecha;

  EventoFechaUnica({this.fecha});

  @override
  bool correspondeAFecha(DateTime dia) {
    return dia.day == fecha.day &&
        dia.month == fecha.month &&
        dia.year == fecha.year;
  }

  @override
  List<DateTime> proximosEventos(int cant) {
    List<DateTime> res = new List();
    res.add(fecha);
    return res;
  }
}
