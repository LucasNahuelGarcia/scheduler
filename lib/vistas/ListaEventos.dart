import 'package:flutter/material.dart';
import 'package:scheduler/componentesVista/CardEvento.dart';
import 'package:scheduler/storage/Evento.dart';
import 'package:scheduler/storage/storage.dart' as storage;

class ListaEventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, "CrearEvento"),
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Proximos Eventos"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Evento _evento = storage.eventos.elementAt(index);
                return CardEvento(_evento);
              },
              childCount: storage.eventos.length,
            ),
          )
        ],
      ),
    );
  }
}
