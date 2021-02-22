import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/src/io/componentesVista/SelectorFechaCompacto.dart';
import 'package:scheduler/src/io/componentesVista/SelectorTiempoRepeticion.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';

class FechaEvento extends StatelessWidget {
  final Evento _nuevoEvento;
  FechaEvento(this._nuevoEvento);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(_nuevoEvento),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Fecha evento"),
      ),
      body: Form(
        child: Column(
          children: [
            ListTile(
              leading: Text(
                "Fecha: ",
                style: Theme.of(context).textTheme.headline6,
              ),
              title: SelectorFechaCompacto(
                onDateChanged: (date) {
                  _nuevoEvento.fecha = date;
                },
              ),
            ),
            Card(
              child: Column(
                children: [
                  Text(
                    "Repetir cada:",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SelectorTiempoRepeticion(
                    onChange: (val) {
                      _nuevoEvento.repeticion = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
