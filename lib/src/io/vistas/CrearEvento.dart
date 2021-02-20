import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/TemaEventos/TemaEventos.dart';
import 'package:scheduler/src/io/vistas/FechaEvento.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class CrearEvento extends StatelessWidget {
  final _globalKey = new GlobalKey<FormState>();
  final _evento = new Evento(titulo: "", eventBehaviour: null, importancia: 0);

  void submitForm(BuildContext context) {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => FechaEvento(_evento),
        ),
      )
          .then(
        (value) {
          if (value != null) {
            Provider.of<StorageManager>(context, listen: false)
                .addEvento(_evento);
            Navigator.of(context).pop();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => submitForm(context),
        child: Icon(Icons.navigate_next),
      ),
      appBar: AppBar(
        title: Text("Crear Evento"),
      ),
      body: Form(
        key: _globalKey,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                autofocus: true,
                onFieldSubmitted: (s) => focusNode.requestFocus(),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: "Nombre del evento"),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textCapitalization: TextCapitalization.sentences,
                validator: (s) {
                  String res;
                  if (s.isEmpty) res = "Ingrese un nombre.";
                  return res;
                },
                onSaved: (s) {
                  _evento.titulo = s;
                },
              ),
            ),
            ListTile(
              leading: FlatButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              title: TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(hintText: "Notas"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                title: Text(
                  "Importancia",
                ),
                subtitle: SelectorImportanciaEvento(
                  colores: Provider.of<TemaEventos>(context).colores,
                  onChanged: (val) => _evento.importancia = val,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      label: "Importancia",
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
