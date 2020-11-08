import 'package:arte_y_monumentos/providers/data_providers.dart';
import 'package:arte_y_monumentos/screens/listatipos_screen.dart';
import 'package:arte_y_monumentos/screens/mapa_screen.dart';
import 'package:arte_y_monumentos/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:arte_y_monumentos/models/monumento_model.dart';

class ListaMonumentosFiltrados extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de arte y monumentos"),
        backgroundColor: Colors.deepPurple[300],
      ),
      drawer: MenuWidget(),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.deepPurple[300],
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: dataProvider.cargarMonumentosTipo(
          box.read('NombreLocalidad') ?? args['NombreLocalidad'],
          box.read('Tipo') ?? args['Tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(List<Monumento> data) {
    final List<Widget> lst = [];
    var aux;
    data.forEach((element) {
      if (element.estilo != "") {
        aux = Text("Estilo: " + element.estilo);
      }
      final w = ListTile(
        title: Text(element.nombre),
        subtitle: aux,
        trailing: Icon(
          Icons.location_city,
          color: Color(0xFFCE93D8),
        ),
        onTap: () {
          Get.offAll(
              MapaMonumento(
                mnto: element,
              ),
              arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
