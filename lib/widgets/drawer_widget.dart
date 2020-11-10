import 'package:arte_y_monumentos/screens/listalocalidades_screen.dart';
import 'package:arte_y_monumentos/screens/listamonumentosfiltrados_screen.dart';
import 'package:arte_y_monumentos/screens/listatipos_screen.dart';
import 'package:arte_y_monumentos/screens/listazonas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuWidget extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String zona = box.read('DescripZona');
    String localidad = box.read('NombreLocalidad');
    String tipo = box.read('Tipo');
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/escudo.png'),
                    fit: BoxFit.fitHeight)),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.visibility,
            color: Colors.deepPurple[300],
          ),
          title: Text('Zona Monumentos'),
          onTap: () {
            Get.offAll(ListZonasScreen());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.location_city,
            color: Colors.deepPurple[300],
          ),
          title: Text('Localidades Monumentos'),
          onTap: () {
            if (zona != null) {
              Get.offAll(ListaLocalidades());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.view_list,
            color: Colors.deepPurple[300],
          ),
          title: Text('Tipos Monumentos'),
          onTap: () {
            if (localidad != null) {
              Get.offAll(ListaTiposScreen());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.amp_stories,
            color: Colors.deepPurple[300],
          ),
          title: Text('Monumentos'),
          onTap: () {
            if ((localidad != null) && (tipo != null)) {
              Get.offAll(ListaMonumentosFiltrados());
            }
          },
        ),
        Divider(),
      ]),
    );
  }
}
