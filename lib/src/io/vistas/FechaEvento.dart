import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/src/io/componentesVista/SelectorFechaCompacto.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/Evento/EventoFechaUnica.dart';

class FechaEvento extends StatelessWidget {
  final Evento _nuevoEvento;
  FechaEvento(this._nuevoEvento);

  @override
  Widget build(BuildContext context) {
    _nuevoEvento.eventBehaviour = EventoFechaUnica(fecha: DateTime.now());
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              title: SelectorFechaCompacto(
                onDateChanged: (date) {
                  _nuevoEvento.eventBehaviour = EventoFechaUnica(fecha: date);
                },
              ),
            ),
            Card(
              child: Column(
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text("Dias"),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Meses"),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Años"),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 220,
                    child: PageView(
                      allowImplicitScrolling: false,
                      children: [
                        Text("Periodo en dias"),
                        Text("Periodo en Meses"),
                        Text("Periodo en Años"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
