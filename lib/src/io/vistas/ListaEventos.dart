import 'package:flutter/material.dart';
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
          ProximosEventos(StorageManager.instancia.eventos),
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
