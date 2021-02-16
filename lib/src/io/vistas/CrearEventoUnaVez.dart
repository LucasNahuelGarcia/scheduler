import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/Evento/RepeticionEvento.dart';
import 'package:scheduler/src/storage/storage.dart';

class CrearEventoUnaVez extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateCrearEventoUnaVez();
  }
}

class _StateCrearEventoUnaVez extends State<CrearEventoUnaVez> {
  DateTime _dateTime = DateTime.now();
  String _titulo = "Evento 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evento de Una Vez"),
      ),
      body: Form(
        child: Column(
          children: [
            Text(
              "Nombre del evento",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              onChanged: (s) {
                _titulo = s;
              },
            ),
            Text(
              "¿Cuándo ocurre el evento?",
              style: TextStyle(fontSize: 20),
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 100),
              onDateChanged: (p) => _dateTime = p,
            ),
            ElevatedButton(
              child: Text("Crear"),
              onPressed: () {
                StorageManager.instancia.addEvento(
                  Evento(
                    fecha: _dateTime,
                    titulo: _titulo,
                    repeticionEvento: RepeticionEvento(
                      Duration(seconds: 0),
                    ),
                  ),
                );
                Navigator.of(context).popUntil((r) => r.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
