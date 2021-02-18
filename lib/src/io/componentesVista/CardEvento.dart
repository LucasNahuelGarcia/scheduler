import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'Fecha.dart';

class CardEvento extends StatelessWidget {
  final Evento evento;
  final DateTime fecha;

  CardEvento({@required this.evento, @required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.access_alarm),
            Column(
              children: [
                Text(
                  evento.titulo,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
