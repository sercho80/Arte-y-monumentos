import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/listazonas_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String zona = box.read('zona');
    String localidad = box.read('localidad');
    String tipo = box.read('tipo');

    return GetMaterialApp(
      title: 'Arte y Monumentos',
      home: ListZonasScreen(),
      /*home: (tipo != null)
          ? ListaPuntosFiltradaScreen()
          : (localidad != null)
              ? ListaTiposScreen()
              : (zona != null)
                  ? ListLocalidadesScreen()
                  : ListMancomunidadesScreen(),*/
      debugShowCheckedModeBanner: false,
    );
  }
}
