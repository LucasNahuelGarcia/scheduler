import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler/src/io/componentesVista/CardEvento.dart';
import 'package:scheduler/src/io/componentesVista/SeparadorConFecha.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/Notificaciones/notificationHelper.dart';
import 'package:scheduler/src/storage/StorageManager.dart';

class ListaEventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "CrearEvento");
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Proximos Eventos"),
          ),
          Consumer<StorageManager>(
            builder: (context, model, _) => FutureBuilder<List<Evento>>(
              future: model.eventos,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
                Widget res = SliverFillRemaining(
                  child: CircularProgressIndicator(),
                );
                if (snapshot.hasData) {
                  if (snapshot.data.isNotEmpty)
                    res = ProximosEventos(snapshot.data);
                  else
                    res = SliverFillRemaining(
                      child: Text("No hay datos che."),
                    );
                } else if (snapshot.hasError)
                  res = SliverFillRemaining(
                    child: Text("No hay datos che."),
                  );
                return res;
              },
            ),
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
    List<CardEvento> cardsEventos = _getEventosParaMostrar(3);

    cardsEventos.sort(
      (a, b) => _compareCardEvento(a, b),
    );

    List<Widget> lista = _agregarFechasAListaDeEventos(cardsEventos);
    lista.add(Padding(padding: EdgeInsets.symmetric(vertical: 50)));

    return SliverList(
      delegate: SliverChildListDelegate(
        lista,
      ),
    );
  }

  int _compareCardEvento(CardEvento a, CardEvento b) {
    DateTime adt = a.fecha ?? DateTime(0);
    DateTime bdt = b.fecha ?? DateTime(0);
    return adt.compareTo(bdt);
  }

  List<CardEvento> _getEventosParaMostrar(int cantDeEventos) {
    List<CardEvento> eventos = new List();
    for (Evento e in _eventos) {
      for (DateTime date in (e.fechas)) {
        eventos.add(
          CardEvento(
            evento: e,
            fecha: date,
          ),
        );

        print("${e.titulo}-Date: $date");
      }
    }
    return eventos;
  }

  List<Widget> _agregarFechasAListaDeEventos(List<CardEvento> cardsEventos) {
    List<Widget> eventosConFechas = new List();
    DateTime last;
    for (int i = 0; i < cardsEventos.length; i++) {
      if (last == null || !_mismoDia(cardsEventos[i].fecha, last)) {
        eventosConFechas.add(
          SeparadorConFecha(
            fecha: cardsEventos[i].fecha,
          ),
        );
        last = cardsEventos[i].fecha;
      }

      eventosConFechas.add(cardsEventos[i]);
    }

    return eventosConFechas;
  }

  bool _mismoDia(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }
}
