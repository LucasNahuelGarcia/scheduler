import 'package:flutter_test/flutter_test.dart';
import 'package:scheduler/src/storage/Evento/DistanciaTiempo.dart';

void main() {
  test("Crear DistanciaTiempo", () {
    DistanciaTiempo distanciaTiempo = DistanciaTiempo(
      dias: 2,
      horas: 3,
      years: 4,
      meses: 5,
    );

    expect(distanciaTiempo.dias, 2);
    expect(distanciaTiempo.horas, 3);
    expect(distanciaTiempo.years, 4);
    expect(distanciaTiempo.meses, 5);
  });

  test("Sumar DistanciaTiempo", () {
    DateTime fecha = DateTime(
      20, // year
      8, // month
      24, // day
      22, // hour
    );

    DistanciaTiempo dt = DistanciaTiempo(
      years: 4,
      meses: 5,
      dias: 2,
      horas: 3,
    );

    DateTime res = dt.addTo(fecha);

    expect(res.hour, 1, reason: "horas");
    expect(res.day, 27, reason: "dias");
    expect(res.month, 1, reason: "meses");
    expect(res.year, 25, reason: "meses");
  });
}
