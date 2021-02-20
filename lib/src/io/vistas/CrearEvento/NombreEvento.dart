import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/TemaEventos/TemaEventos.dart';
import 'package:scheduler/src/io/componentesVista/SelectorImportanciaEvento.dart';
import 'package:scheduler/src/io/vistas/CrearEvento/FechaEvento.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class NombreEvento extends StatelessWidget {
  final _globalKey = new GlobalKey<FormState>();
  final _evento = new Evento(titulo: "", eventBehaviour: null, importancia: 0);

  void submitForm(BuildContext context) {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      Navigator.of(context)
          .push(PageRouteBuilder(
              transitionDuration: Duration(seconds: 5),
              transitionsBuilder: (context, anim, secondAnim, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.easeIn;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return Stack(
                  children: [
                    SlideTransition(
                      position: secondAnim.drive(tween),
                      child: child,
                    ),
                    SlideTransition(
                      position: anim.drive(tween),
                      child: child,
                    ),
                  ],
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FechaEvento(_evento)))
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          submitForm(context);
        },
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
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: "Nombre del evento"),
                style: Theme.of(context).textTheme.headline4,
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
                decoration: InputDecoration(hintText: "Notas"),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Importancia",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectorImportanciaEvento(
                      colores: Provider.of<TemaEventos>(context).colores,
                      onChanged: (val) => _evento.importancia = val,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
