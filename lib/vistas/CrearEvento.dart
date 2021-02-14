import 'package:flutter/material.dart';
import 'package:scheduler/componentesVista/BotonFlecha.dart';
import 'package:scheduler/storage/Evento.dart';

class CrearEvento extends StatelessWidget {
  final Evento _evento = new Evento();
  TipoDeEvento _tipoDeEvento = TipoDeEvento.Periodico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: BotonFlecha(
                    child: Text(
                      "Periodico",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {},
                  ),
                ),
                ListTile(
                  leading: BotonFlecha(
                    child: Text(
                      "Unico",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectorTipoEvnto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateSelectorTipoEvento();
  }
}

class StateSelectorTipoEvento extends State<SelectorTipoEvnto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TileTipoEvento(value: TipoDeEvento.Periodico, groupValue: ,)
      ],
    );
  }
}

class TileTipoEvento extends ListTile {
  final TipoDeEvento value;
  final TipoDeEvento groupValue;
  final Function(void) onChanged;
  TileTipoEvento({this.onChanged, this.value, this.groupValue});
  @override
  Widget get leading => Radio<TipoDeEvento>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      );
}
