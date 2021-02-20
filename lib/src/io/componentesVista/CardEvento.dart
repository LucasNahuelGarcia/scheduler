import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/TemaEventos/TemaEventos.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';

class CardEvento extends StatelessWidget {
  final Evento evento;
  final DateTime fecha;

  CardEvento({@required this.evento, @required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Provider.of<TemaEventos>(context).colores[evento.importancia],
              Provider.of<TemaEventos>(context).colores[evento.importancia],
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${fecha.hour ~/ 10}${fecha.hour % 10}:${fecha.minute ~/ 10}${fecha.minute % 10}",
              style: TextStyle(fontSize: 25),
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Text(
              evento.titulo,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
