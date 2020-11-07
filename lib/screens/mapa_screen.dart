import 'package:arte_y_monumentos/models/monumento_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:utm/utm.dart';

class MapaMonumento extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

//STUB
class _MapScreenState extends State<MapaMonumento> {
  final Future<Position> geolocator =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  final mapa = new MapController();
  Monumento mnto;

  @override
  Widget build(BuildContext context) {
    mnto = Get.arguments;
    final latlon = UTM.fromUtm(
        easting: double.parse(mnto.georrX),
        northing: double.parse(mnto.georrY),
        zoneNumber: 30,
        zoneLetter: "N");
    return new FlutterMap(
      mapController: mapa,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                //completar
                'TOKENSITO',
            'id': 'mapbox.satellite',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(42.80, -1.64),
              builder: (ctx) => new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
