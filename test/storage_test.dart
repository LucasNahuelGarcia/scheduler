import 'package:flutter_test/flutter_test.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:scheduler/src/storage/SQL_StorageManager.dart';
import 'package:scheduler/src/storage/StorageManager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("Agregar y obtener evento.", () {
    StorageManager sm = SQLStorageManager();
    String titulo = "paparruchas";
    DateTime fecha = DateTime(12, 13, 14, 15, 16, 17);
    Evento e = Evento(
      titulo: "paparruchas",
      fechas:[ fecha],
      importancia: 1,
    );

    sm.addEvento(e);

    expect(
      sm.eventos.length,
      1,
      reason: "los eventos agregados y los recuperados no coinciden.",
    );
    expect(
      sm.eventos[0].titulo,
      e.titulo,
      reason: "El evento agregado no tiene el mismo nombre.",
    );
    expect(
      sm.eventos[0].importancia,
      e.importancia,
      reason: "El evento agregado no tiene la misma importancia.",
    );
  });
}
