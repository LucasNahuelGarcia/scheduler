import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'dart:ui';
import 'StorageManager.dart';
import 'package:hive/hive.dart';

class HiveStorageManager implements StorageManager {
  @override
  Future<int> addEvento(Evento evento) {
    // TODO: implement addEvento
    throw UnimplementedError();
  }

  @override
  Future<int> addFecha(int idEvento, DateTime fecha) {
    // TODO: implement addFecha
    throw UnimplementedError();
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement eventos
  Future<List<Evento>> get eventos => throw UnimplementedError();

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  Future<int> removeEvento(Evento evento) {
    // TODO: implement removeEvento
    throw UnimplementedError();
  }

  @override
  Future removeEventoConID(int id) {
    // TODO: implement removeEventoConID
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
  
}
