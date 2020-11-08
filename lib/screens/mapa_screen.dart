import 'package:arte_y_monumentos/models/monumento_model.dart';
import 'package:arte_y_monumentos/screens/listamonumentosfiltrados_screen.dart';
import 'package:arte_y_monumentos/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:utm/utm.dart';
import 'package:latlong/latlong.dart';

class MapaMonumento extends StatefulWidget {
  final Monumento mnto;
  MapaMonumento({@required this.mnto});

  @override
  _MapaMonumentoInfo createState() => _MapaMonumentoInfo(mnto: mnto);
}

class _MapaMonumentoInfo extends State<MapaMonumento> {
  Map<String, Object> args = new Map<String, Object>();
  final Monumento mnto;
  final mapa = new MapController();
  final _url = "https://www.turismo.navarra.es/imgs/rrtt/";
  var latlon;

  _MapaMonumentoInfo({@required this.mnto}) {
    latlon = UTM.fromUtm(
      easting: double.parse(mnto.georrX),
      northing: double.parse(mnto.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }

  _geturl() {
    return _url + mnto.path + mnto.imgFichero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del monumento"),
        backgroundColor: Colors.deepPurple[300],
      ),
      drawer: MenuWidget(),
      body: Column(
        children: [
          _info(context),
          Container(
              child: _mapa(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.47),
          Divider(),
          Center(
            child: Image.network(
              _geturl(),
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 325.0),
            child: FloatingActionButton(
              onPressed: () {
                Get.offAll(ListaMonumentosFiltrados(), arguments: args);
              },
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.deepPurple[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(context) {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.075,
        child: ListView(
          children: [
            Text(
              mnto.nombre,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ));
  }

  Widget _mapa() {
    return new FlutterMap(
      mapController: mapa,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 18.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoiaGFtYWxhc2FiYSIsImEiOiJja2dqNXdhMXEwdjE3MnN0ZTdvZTVheDdyIn0.fSTTljpXC2GUY4TsSF0_qw',
            'id': 'mapbox.satellite',
          },
        ),
        MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(latlon.lat, latlon.lon),
              builder: (ctx) => new Container(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.purple[200],
                  size: 50,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
