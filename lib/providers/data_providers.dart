import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';

class Monumento {
  String tipo;

  List<String> tipos = [
    'Punto limpio fijo',
    'Aceite de cocina usado',
    'Compostaje comunitario',
    'Pilas',
    'Ropa y calzado',
  ];

  List<Monumento> listaPuntos = [];
  List<String> listaMancomunidades = [];
  List<String> listalocalidades = [];
  List<String> tipoLocalidad = [];
  List<Monumento> tipoPunto = [];
/*
  Future<List<PuntoReciclaje>> cargarPuntos() async {
    final data = await rootBundle.loadString('data/ReciclajesGlobal.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    listaPuntos = puntos.lista;
    return listaPuntos;
  }

  Future<List<String>> cargarMancomunidades() async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaMancomunidades = [];
    listaPuntos.forEach((pnt) {
      if (listaMancomunidades.indexOf(pnt.mancomunidad) < 0) {
        listaMancomunidades.add(pnt.mancomunidad);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
    return listaMancomunidades;
  }

  Future<List<String>> cargarLocalidades(String str) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listalocalidades = [];
    listaPuntos.forEach((element) {
      if (element.mancomunidad == str) {
        if (listalocalidades.indexOf(element.localidad) < 0) {
          listalocalidades.add(element.localidad);
        }
      }
    });
    return listalocalidades;
  }

  Future<List<String>> cargarTipos(String str) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    tipoLocalidad = [];
    listaPuntos.forEach((element) {
      if ((element.localidad == str) &&
          (tipoLocalidad.indexOf(element.tipoEquipamiento) < 0)) {
        tipoLocalidad.add(element.tipoEquipamiento);
      }
    });
    return tipoLocalidad;
  }

  Future<List<PuntoReciclaje>> cargarPuntosTipo(String loc, String tipo) async {
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    tipoPunto = [];
    listaPuntos.forEach((element) {
      if ((element.localidad == loc) && (element.tipoEquipamiento == tipo)) {
        tipoPunto.add(element);
      }
    });
    return tipoPunto;
  }*/
}

final dataProvider = new Monumento();
