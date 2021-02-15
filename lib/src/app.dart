import 'package:flutter/material.dart';
import 'package:scheduler/src/io/vistas/CrearEventoUnaVez.dart';
import 'package:scheduler/src/io/vistas/ListaEventos.dart';
import 'package:scheduler/src/io/vistas/CrearEvento.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      title: 'Scheduler',
      home: ListaEventos(),
      routes: <String, WidgetBuilder>{
        "ListaEventos": (BuildContext context) => ListaEventos(),
        "CrearEvento": (BuildContext context) => CrearEvento(),
        "CrearEventoUnaVez": (BuildContext context) => CrearEventoUnaVez(),
      },
    );
  }
}
