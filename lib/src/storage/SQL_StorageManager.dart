import 'package:scheduler/src/storage/Notificaciones/notificationHelper.dart';
import 'package:scheduler/src/storage/SQL_DB.dart';
import 'package:scheduler/src/storage/StorageManager.dart';
import 'Evento/Evento.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class SQLStorageManager extends StorageManager {
  final SQL_DB _dbHandler = SQL_DB.instancia;

  Future<int> _agregarEvento(Evento e) async {
    Database db = await _dbHandler.getDB();
    e.id = await _insertEventoEnSQL(db, e);

    for (DateTime fecha in e.fechas) {
      await _addFecha(e.id, fecha);
      NotificationHandler.instancia.scheduleNotificationEventoAtDate(e, fecha);
    }

    return e.id;
  }

  Future<int> _insertEventoEnSQL(Database db, Evento e) async {
    int id = await db.insert(SQL_DB.tablaEventosName, {
      SQL_DB.titulo: e.titulo,
      SQL_DB.importancia: e.importancia,
    });
    return id;
  }

  Future _eliminarEvento(int idEvento) async {
    return -1;
  }

  Future<int> _addFecha(int idEvento, DateTime fecha) async {
    Database db = await _dbHandler.getDB();
    int id = await db.insert(SQL_DB.tablaFechasName, {
      SQL_DB.idEvento: idEvento,
      SQL_DB.fecha: fecha.toUtc().microsecondsSinceEpoch,
    });
    print("Se agrego la fecha:\n---$fecha,\n---evento: $idEvento");
    return id;
  }

  @override
  Future<List<Evento>> get eventos async {
    List<Evento> eventos;
    List<Map<String, dynamic>> maps = await _queryEventosFromDB();

    if (maps != null && maps.isNotEmpty)
      eventos = await _parseEventos(maps);
    else
      eventos = List<Evento>();

    return eventos;
  }

  Future<List<Map<String, dynamic>>> _queryEventosFromDB() async {
    Database db = await _dbHandler.getDB();
    List<Map<String, dynamic>> maps =
        await db.query(SQL_DB.tablaEventosName, columns: [
      SQL_DB.id,
      SQL_DB.titulo,
      SQL_DB.importancia,
    ]);
    return maps;
  }

  Future<List<Evento>> _parseEventos(List<Map<String, dynamic>> maps) async {
    List<Evento> eventos = List<Evento>();
    for (Map<String, dynamic> map in maps) {
      eventos.add(Evento(
        id: map[SQL_DB.id],
        titulo: map[SQL_DB.titulo],
        importancia: map[SQL_DB.importancia],
        fechas: (await _encontrarFecha(map[SQL_DB.id])),
      ));
    }

    return eventos;
  }

  Future<List<DateTime>> _encontrarFecha(int idEvento) async {
    List<Map<String, dynamic>> maps = await _queryFechasFromDB(idEvento);
    List<DateTime> fechas = _parseMapsFechas(maps);

    print("Se encontraron ${fechas.length} fechas para el evento $idEvento");

    return fechas;
  }

  List<DateTime> _parseMapsFechas(List<Map<String, dynamic>> maps) {
    List<DateTime> fechas = List<DateTime>();

    for (Map<String, dynamic> map in maps)
      fechas.add(
        DateTime.fromMicrosecondsSinceEpoch(map[SQL_DB.fecha], isUtc: true)
            .toLocal(),
      );

    return fechas;
  }

  Future<List<Map<String, dynamic>>> _queryFechasFromDB(int idEvento) async {
    Database db = await _dbHandler.getDB();
    List<Map<String, dynamic>> maps = await db.query(
      SQL_DB.tablaFechasName,
      columns: [
        SQL_DB.id,
        SQL_DB.fecha,
        SQL_DB.idEvento,
      ],
      where: "${SQL_DB.idEvento} = $idEvento",
    );
    return maps;
  }

  @override
  Future<int> addEvento(Evento evento) async {
    evento.id = await _agregarEvento(evento);
    notifyListeners();
    return evento.id;
  }

  @override
  Future<int> removeEvento(Evento evento) async {
    int idEvento = await _eliminarEvento(evento.id);
    notifyListeners();
    return idEvento;
  }

  @override
  Future removeEventoConID(int idEvento) async {
    await _eliminarEvento(idEvento);
    notifyListeners();
  }

  @override
  Future<int> addFecha(int idEvento, DateTime fecha) async {
    int id = await _addFecha(idEvento, fecha);
    notifyListeners();
    return id;
  }
}
