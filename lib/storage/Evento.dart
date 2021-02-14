class Evento {
  final DateTime _dateTime;
  final String _titulo;

  Evento(this._dateTime, this._titulo);

  DateTime get fecha => _dateTime;
  String get titulo => _titulo;
}
