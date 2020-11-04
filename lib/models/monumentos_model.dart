import 'puntos_monumentos_model.dart';

class Monumentos {
  List<Monumento> lista = new List();

  Monumentos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) {
      final pnt = Monumento.fromJson(element);
      lista.add(pnt);
    });
  }
}