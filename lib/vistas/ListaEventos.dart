import 'package:flutter/material.dart';
import 'package:scheduler/componentesVista/CardEvento.dart';
import 'package:scheduler/storage/Evento.dart';
import 'package:scheduler/storage/storage.dart';

class ListaEventos extends StatelessWidget {
  Key _proximosEventosKey = new GlobalKey();
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
          ProximosEventos(),
        ],
      ),
    );
  }
}

class ProximosEventos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateProximosEventos();
  }
}

class _StateProximosEventos extends State<ProximosEventos> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Evento _evento = StorageManager.instancia.eventos.elementAt(index);
          return CardEvento(_evento);
        },
        childCount: StorageManager.instancia.eventos.length,
      ),
    );
  }
}
