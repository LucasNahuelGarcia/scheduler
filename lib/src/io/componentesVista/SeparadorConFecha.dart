import 'package:flutter/material.dart';
import 'package:scheduler/src/io/componentesVista/Fecha.dart';

class SeparadorConFecha extends StatelessWidget {
  final DateTime fecha;
  final double grosor;
  final double separatorHeight;

  SeparadorConFecha({this.fecha, this.grosor, this.separatorHeight});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Fecha(fecha),
      title: Divider(),
    );
  }
}
