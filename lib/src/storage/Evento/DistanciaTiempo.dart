class DistanciaTiempo {
  int horas;
  int dias;
  int meses;
  int years;

  DistanciaTiempo({
    this.meses = 0,
    this.dias = 0,
    this.horas = 0,
    this.years = 0,
  }) {
    dias += horas ~/ 24;
    horas %= 24;

    years += meses ~/ 12;
    meses %= 12;
  }

  DateTime addTo(DateTime date) {
    DateTime res = date.add(Duration(days: dias, hours: horas));

    res = DateTime(res.year + years, res.month + meses, res.day, res.hour,
        res.minute, res.second, res.millisecond, res.millisecond);

    return res;
  }
}
