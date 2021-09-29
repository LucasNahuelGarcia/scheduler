import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/TemaEventos/TemaEventos.dart';
import 'package:scheduler/src/io/vistas/ListaEventos.dart';
import 'package:scheduler/src/io/vistas/CrearEvento/NombreEvento.dart';
import 'package:scheduler/src/storage/SQL_StorageManager.dart';
import 'package:scheduler/src/storage/StorageManager.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StorageManager>(
          create: (context) => SQLStorageManager(),
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
          "CrearEvento": (BuildContext context) => NombreEvento(),
        },
      ),
    );
  }
}
