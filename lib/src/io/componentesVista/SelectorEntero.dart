import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectorEntero extends StatefulWidget {
  final int valActual;
  final Function(int) onChanged;
  final int minValue;
  final int maxValue;
  final Widget trailing;

  SelectorEntero({
    this.valActual,
    @required this.onChanged,
    @required this.minValue,
    @required this.maxValue,
    this.trailing,
  });

  @override
  State<StatefulWidget> createState() {
    return _StateSelectorEntero(
      valActual: valActual,
      onChanged: onChanged,
      minValue: minValue,
      maxValue: maxValue,
      trailing: this.trailing,
    );
  }
}

class _StateSelectorEntero extends State<SelectorEntero> {
  int valActual;
  final Function(int) onChanged;
  final int minValue;
  final int maxValue;
  final Widget trailing;

  _StateSelectorEntero({
    this.valActual,
    this.trailing,
    @required this.onChanged,
    @required this.minValue,
    @required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    if (valActual == null) valActual = minValue;
    return Column(
      children: [
        NumberPicker.integer(
          initialValue: valActual,
          minValue: minValue,
          maxValue: maxValue,
          onChanged: (val) {
            setState(() {
              this.valActual = val;
            });
            onChanged(val);
          },
        ),
        this.trailing ?? Container(),
      ],
    );
  }
}
