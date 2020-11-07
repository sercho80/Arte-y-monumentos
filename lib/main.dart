import 'package:arte_y_monumentos/screens/listalocalidades_screen.dart';
import 'package:arte_y_monumentos/screens/listamonumentosfiltrados_screen.dart';
import 'package:arte_y_monumentos/screens/listatipos_screen.dart';
import 'package:arte_y_monumentos/screens/listazonas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String zona = box.read('DescripZona');
    String localidad = box.read('NombreLocalidad');
    String tipo = box.read('Tipo');

    return GetMaterialApp(
      title: 'Arte y Monumentos',
      home: (tipo != null)
          ? ListaMonumentosFiltrados()
          : (localidad != null)
              ? ListaTiposScreen()
              : (zona != null)
                  ? ListaLocalidades()
                  : ListZonasScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
