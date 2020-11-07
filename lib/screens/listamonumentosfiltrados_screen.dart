import 'package:arte_y_monumentos/providers/data_providers.dart';
import 'package:arte_y_monumentos/screens/listatipos_screen.dart';
import 'package:arte_y_monumentos/screens/mapa_screen.dart';
import 'package:arte_y_monumentos/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaMonumentosFiltrados extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments() ?? new Map<String, Object>();

    return Scaffold(
      appBar: AppBar(title: Text("Lista de arte y monumentos")),
      drawer: MenuWidget(),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: dataProvider.cargarMonumentosTipo(
          box.read('NombreLocalidad') ?? args['NombreLocalidad'],
          box.read('Tipo') ?? args['Tipo']),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.arrow_back),
        onTap: () {
          Get.offAll(MapaMonumento(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
