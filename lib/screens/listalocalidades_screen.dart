import 'dart:js';

import 'package:arte_y_monumentos/providers/data_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaLocalidades extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('localidad', null);
    box.write('tipo', null);

    args = Get.arguments();

    return Scaffold(
      appBar: AppBar(title: Text("Arte y Monumentos por localidad")),
      //drawer: MenuWidget(),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaZonasScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: dataProvider.cargarLocalidades(box.read('zona')) ?? args['zona'],
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
          box.write('localidad', element);
          args['localidad'] = element;
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
