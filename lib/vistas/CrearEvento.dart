import 'package:flutter/material.dart';
import 'package:scheduler/componentesVista/BotonFlecha.dart';

class CrearEvento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tipo de evento",
            style: TextStyle(fontSize: 40, color: Colors.black54),
          ),
          BotonFlecha(
            child: Text(
              "Periodico",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed("CrearEventoPeriodico"),
          ),
          BotonFlecha(
            child: Text(
              "Una vez",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed("CrearEventoUnaVez"),
          ),
        ],
      ),
    );
  }
}
