import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQL_DB {
  SQL_DB._();

  static const dbName = "eventos.db";
  static const tablaEventosName = "eventos";
  static const tablaFechasName = "fechas";
  static const id = "id";
  static const titulo = "titulo";
  static const importancia = "importancia";
  static const idEvento = "idEvento";
  static const fecha = "fecha";
  static final SQL_DB instancia = SQL_DB._();
  static Database _db;

  Future<Database> getDB() async {
    if (_db == null)
      _db = await openDatabase(
        join(await getDatabasesPath(), dbName),
        version: 3,
        onCreate: (Database db, int version) async {
          await _crearTablaEventos(db);
          await _crearTablaFechas(db);
        },
        onUpgrade: (Database db, int version, v) async {
          print("Update database");
          await db.execute("DROP TABLE $tablaEventosName");
          await db.execute("DROP TABLE $tablaFechasName");
          await _crearTablaEventos(db);
          await _crearTablaFechas(db);
        },
      );

    return _db;
  }

  Future _crearTablaEventos(Database db) async {
    await db.execute("""CREATE TABLE $tablaEventosName(
    $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $titulo TEXT NOT NULL,
    $importancia INTEGER NOT NULL
    );""");
  }

  Future _crearTablaFechas(Database db) async {
    await db.execute("""CREATE TABLE $tablaFechasName(
     $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
     $fecha INTEGER NOT NULL,
     $idEvento INTEGER NOT NULL,
     FOREIGN KEY($idEvento) REFERENCES $tablaEventosName($id)
    );""");
  }
}
