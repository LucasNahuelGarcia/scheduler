import 'package:flutter/material.dart';

class SelectorImportanciaEvento extends StatefulWidget {
  final List<Color> colores;
  final Function(int val) onChanged;

  SelectorImportanciaEvento({
    @required this.colores,
    @required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return StateSelectorImportanciaEvento(
      colores: colores,
      onChanged: onChanged,
    );
  }
}

class StateSelectorImportanciaEvento extends State<SelectorImportanciaEvento> {
  final List<Color> colores;
  final Function(int val) onChanged;

  StateSelectorImportanciaEvento({
    @required this.colores,
    @required this.onChanged,
  });

  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: colores[_value.toInt()],
      value: _value.toDouble(),
      divisions: colores.length - 1,
      onChanged: (v) {
        setState(() {
          _value = v;
        });
        onChanged(v.toInt());
      },
      min: 0,
      max: colores.length.toDouble() - 1,
    );
  }
}
