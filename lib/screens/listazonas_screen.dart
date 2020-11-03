import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaZonasScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('mancomunidad', null);
    box.write('localidad', null);
    box.write('tipo', null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista mancomunidades'),
      ),
      //drawer: MenuWidget(),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        //future: puntosProvider.cargarPuntos(),
        // future: dataProvider.cargarMancomunidades(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: _listaElementos(context, snapshot.data),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('mancomunidad', element);
          args['mancomunidad'] = element;

          //Get.offAll(ListLocalidadesScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
