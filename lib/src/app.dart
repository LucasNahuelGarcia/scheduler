import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/TemaEventos/TemaEventos.dart';
import 'package:scheduler/src/io/vistas/ListaEventos.dart';
import 'package:scheduler/src/io/vistas/CrearEvento.dart';
import 'package:scheduler/src/storage/storage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StorageManager>(
          create: (context) => StorageManager(),
        ),
        Provider(
          create: (context) => TemaEventos(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        title: 'Scheduler',
        home: ListaEventos(),
        routes: <String, WidgetBuilder>{
          "ListaEventos": (BuildContext context) => ListaEventos(),
          "CrearEvento": (BuildContext context) => CrearEvento(),
        },
      ),
    );
  }
}
