import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';

abstract class StorageManager extends ChangeNotifier {
  ///Devuelve una lista con los proximos eventos almacenados.
  Future<List<Evento>> get eventos;

  ///Permite agregar un evento a la base de datos.
  ///Devuelve la id del evento.
  Future<int> addEvento(Evento evento);

  ///Permite remover un elemento de la base de datos.
  ///Devuelve la id del evento.
  Future<int> removeEvento(Evento evento);

  ///Permite remover un elemento con una cierta id de la base de datos.
  Future removeEventoConID(int id);

  ///Agrega una fecha relacionada con un evento.
  ///Devuelve la id de la fecha.
  Future<int> addFecha(int idEvento, DateTime fecha);
}
