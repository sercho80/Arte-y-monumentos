import 'package:arte_y_monumentos/providers/data_providers.dart';
import 'package:arte_y_monumentos/screens/listalocalidades_screen.dart';
import 'package:arte_y_monumentos/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListZonasScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('DescripZona', null);
    box.write('NombreLocalidad', null);
    box.write('Tipo', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Arte y Monumentos por zonas'),
      ),
      drawer: MenuWidget(),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: dataProvider.cargarZonas(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: _listaElementos(context, snapshot.data),
            );
          } else {
            return Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  Center(
                      child: Image(
                          image:
                              Image.asset('assets/images/escudo.png').image)),
                  Center(child: CircularProgressIndicator()),
                ],
              ),
            );
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
          box.write('DescripZona', element);
          args['DescripZona'] = element;
          Get.offAll(ListaLocalidades(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
