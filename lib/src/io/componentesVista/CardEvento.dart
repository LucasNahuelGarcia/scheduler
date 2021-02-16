import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'Fecha.dart';

class CardEvento extends StatelessWidget {
  final Evento _evento;

  CardEvento(this._evento);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Fecha(_evento.fecha),
            Column(
              children: [
                Text(
                  _evento.titulo,
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
