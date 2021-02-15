import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/componentesVista/CardEvento.dart';
import 'package:scheduler/src/storage/Evento.dart';
import 'package:scheduler/src/storage/storage.dart';

class ListaEventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.pushNamed(context, "CrearEvento"),
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Proximos Eventos"),
          ),
          ChangeNotifierProvider<StorageManager>(
            child: Consumer<StorageManager>(
              builder: (context, model, _) => ProximosEventos(model.eventos),
            ),
            create: (BuildContext context) => StorageManager.instancia,
          ),
        ],
      ),
    );
  }
}

class ProximosEventos extends StatelessWidget {
  final List<Evento> _eventos;

  ProximosEventos(this._eventos);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Evento _evento = _eventos.elementAt(index);
          return CardEvento(_evento);
        },
        childCount: StorageManager.instancia.eventos.length,
      ),
    );
  }
}
