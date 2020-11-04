import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:arte_y_monumentos/models/puntos_monumentos_model.dart';
import 'package:arte_y_monumentos/models/monumentos_model.dart';

class PuntosProvider {
  List<Monumento> listaMonumentos = [];
  List<String> listaZonas = [];
  List<String> listaLocalidad = [];
  List<String> listaTipo = [];
  List<Monumento> listaMonumentosFiltrada = [];

  Future<List<Monumento>> cargarPuntos() async {
    final data = await rootBundle.loadString('data/arte_y_monumentos.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Monumentos monumentos = Monumentos.fromJsonList(openDataRow);
    listaMonumentos = monumentos.lista;
    return listaMonumentos;
  }

  Future<List<String>> cargarZonas() async {
    if (listaMonumentos.length == 0) {
      await cargarPuntos();
    }
    listaZonas = [];
    listaMonumentos.forEach((element) {
      if (listaZonas.indexOf(element.descripZona) < 0) {
        listaZonas.add(element.descripZona);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
    return listaZonas;
  }

  Future<List<String>> cargarLocalidades(String str) async {
    if (listaMonumentos.length == 0) {
      await cargarPuntos();
    }
    listaLocalidad = [];
    listaMonumentos.forEach((element) {
      if (element.descripZona == str) {
        if (listaLocalidad.indexOf(element.nombreLocalidad) < 0) {
          listaLocalidad.add(element.nombreLocalidad);
        }
      }
    });
    return listaLocalidad;
  }

  Future<List<String>> cargarTipos(String str) async {
    if (listaMonumentos.length == 0) {
      await cargarPuntos();
    }
    listaTipo = [];
    listaMonumentos.forEach((element) {
      if ((element.nombreLocalidad == str) &&
          (listaTipo.indexOf(element.tipo) < 0)) {
        listaTipo.add(element.tipo);
      }
    });
    return listaTipo;
  }

  Future<List<Monumento>> cargarMonumentosTipo(String loc, String tipo) async {
    if (listaMonumentos.length == 0) {
      await cargarPuntos();
    }
    listaMonumentosFiltrada = [];
    listaMonumentos.forEach((element) {
      if ((element.nombreLocalidad == loc) && (element.tipo == tipo)) {
        listaMonumentosFiltrada.add(element);
      }
    });
    return listaMonumentosFiltrada;
  }
}

final dataProvider = new PuntosProvider();
