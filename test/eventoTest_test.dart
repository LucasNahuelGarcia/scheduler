import 'package:flutter_test/flutter_test.dart';
import 'package:scheduler/src/storage/Evento/DistanciaTiempo.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';

void main() {
  test("Asignar fecha al evento.", () {
    DateTime testTime = DateTime(214, 2, 21, 12, 29, 21);
    Evento e = Evento(fecha: testTime, importancia: 0, titulo: "EventoPrueba");
    expect(e.fecha, testTime);
  });

  test("Fecha con repeticion en dias.", () {
    final int cantRepeticonesTest = 300;
    DateTime testTime = DateTime(214, 2, 21, 12, 29, 21);
    DistanciaTiempo repeticionTest = DistanciaTiempo(dias: 1);
    Evento e = Evento(
      fecha: testTime,
      repeticion: repeticionTest,
      importancia: 0,
      titulo: "EventoPrueba",
    );
    int i = 0;
    for (DateTime fecha in e.proximosEventos(cantRepeticonesTest)) {
      expect(fecha.day, testTime.add(Duration(days: i)).day);
      i++;
    }

    expect(i, cantRepeticonesTest);
  });
  test("Fecha con repeticion en meses.", () {
    final int cantRepeticonesTest = 300;
    DateTime testTime = DateTime(214, 2, 21, 12, 29, 21);
    DistanciaTiempo repeticionTest = DistanciaTiempo(meses: 1);
    Evento e = Evento(
      fecha: testTime,
      repeticion: repeticionTest,
      importancia: 0,
      titulo: "EventoPrueba",
    );
    int i = 0;
    for (DateTime fecha in e.proximosEventos(cantRepeticonesTest)) {
      expect(fecha.month, (testTime.month - 1 + i) % 12 + 1);
      i++;
    }

    expect(i, cantRepeticonesTest);
  });
  test("Fecha con repeticion en horas.", () {
    final int cantRepeticonesTest = 300;
    DateTime testTime = DateTime(214, 2, 21, 12, 29, 21);
    DistanciaTiempo repeticionTest = DistanciaTiempo(meses: 1);
    Evento e = Evento(
      fecha: testTime,
      repeticion: repeticionTest,
      importancia: 0,
      titulo: "EventoPrueba",
    );
    int i = 0;
    for (DateTime fecha in e.proximosEventos(cantRepeticonesTest)) {
      expect(fecha.month, (testTime.month - 1 + i) % 12 + 1);
      i++;
    }

    expect(i, cantRepeticonesTest);
  });
  test("Evento sin repeticion.", () {
    final int cantRepeticonesTest = 300;
    DateTime testTime = DateTime(214, 2, 21, 12, 29, 21);
    Evento e = Evento(
      fecha: testTime,
      importancia: 0,
      titulo: "EventoPrueba",
    );
    int i = 0;
    for (DateTime fecha in e.proximosEventos(cantRepeticonesTest)) {
      expect(fecha.month, testTime.month);
      i++;
    }

    expect(i, 1);
  });
}
