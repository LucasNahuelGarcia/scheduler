import 'package:flutter/material.dart';
import 'package:scheduler/vistas/ListaEventos.dart';
import 'package:scheduler/vistas/CrearEvento.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scheduler',
      home: ListaEventos(),
      routes: <String, WidgetBuilder>{
        "ListaEventos": (BuildContext context) => ListaEventos(),
        "CrearEvento": (BuildContext context) => CrearEvento(),
      },
    );
  }
}
