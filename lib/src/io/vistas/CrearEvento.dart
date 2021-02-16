import 'package:flutter/material.dart';
import 'package:scheduler/src/io/vistas/FechaEvento.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class CrearEvento extends StatelessWidget {
  final _globalKey = new GlobalKey<FormState>();
  final _evento = new Evento();

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    void submitForm() {
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
              StorageManager.instancia.addEvento(_evento);
              Navigator.of(context).pop();
            }
          },
        );
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => submitForm(),
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
            ListTile(
              title: Text(
                "Importancia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            SelectorImportanciaEvento(
              cantiadElementos: 2,
              colorCalmado: Colors.greenAccent,
              colorUrgente: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorImportanciaEvento extends StatelessWidget {
  final int cantiadElementos;
  final Color colorCalmado;
  final Color colorUrgente;
  SelectorImportanciaEvento(
      {this.cantiadElementos, this.colorCalmado, this.colorUrgente});

  List<Widget> _crearElementos() {
    List<Widget> elementos = List<Widget>();

    for (int i = 0; i < cantiadElementos; i++) {
      elementos.add(
        Icon(
          Icons.emoji_emotions,
          size: 35,
          color: Color.lerp(
            colorCalmado,
            colorUrgente,
            i / (cantiadElementos - 1),
          ),
        ),
      );

      print(cantiadElementos / (i + 1));
    }

    return elementos;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _crearElementos(),
    );
  }
}
