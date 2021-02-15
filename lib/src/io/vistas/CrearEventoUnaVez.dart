import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/src/storage/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class CrearEventoUnaVez extends StatelessWidget {
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
              "Fecha",
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
                StorageManager.instancia
                    .addEvento(Evento(fecha: _dateTime, titulo: _titulo));
                Navigator.of(context).popUntil((r) => r.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
