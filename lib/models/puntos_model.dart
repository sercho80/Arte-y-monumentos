import 'package:arte_y_monumentos/models/monumento_model.dart';

class Monumentos {
  List<Monumento> lista = new List();
  Monumentos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = Monumento.fromJson(json);
      lista.add(pr);
    });
  }
}
