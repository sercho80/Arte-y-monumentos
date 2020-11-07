// To parse this JSON data, do
//
//     final monumento = monumentoFromJson(jsonString);

import 'dart:convert';

Monumento monumentoFromJson(String str) => Monumento.fromJson(json.decode(str));

String monumentoToJson(Monumento data) => json.encode(data.toJson());

class Monumento {
  Monumento({
    this.codrecurso,
    this.urlNombreCast,
    this.nombre,
    this.urlNombreBuscador,
    this.urlIdRecursoCategoria,
    this.codCategoria,
    this.idRecursoCategoria,
    this.idcategoria,
    this.nombreLocalidad,
    this.descripZona,
    this.path,
    this.imgFichero,
    this.tipo,
    this.estilo,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codrecurso;
  String urlNombreCast;
  String nombre;
  String urlNombreBuscador;
  String urlIdRecursoCategoria;
  String codCategoria;
  String idRecursoCategoria;
  String idcategoria;
  String nombreLocalidad;
  String descripZona;
  String path;
  String imgFichero;
  String tipo;
  String estilo;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory Monumento.fromJson(Map<String, dynamic> json) => Monumento(
        codrecurso: json["Codrecurso"],
        urlNombreCast: json["URLNombreCast"],
        nombre: json["Nombre"],
        urlNombreBuscador: json["URLNombreBuscador"],
        urlIdRecursoCategoria: json["URLIdRecursoCategoria"],
        codCategoria: json["CodCategoria"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        idcategoria: json["IDCATEGORIA"],
        nombreLocalidad: json["NombreLocalidad"],
        descripZona: json["DescripZona"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        tipo: json["Tipo"],
        estilo: json["ESTILO"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "Codrecurso": codrecurso,
        "URLNombreCast": urlNombreCast,
        "Nombre": nombre,
        "URLNombreBuscador": urlNombreBuscador,
        "URLIdRecursoCategoria": urlIdRecursoCategoria,
        "CodCategoria": codCategoria,
        "IdRecursoCategoria": idRecursoCategoria,
        "IDCATEGORIA": idcategoria,
        "NombreLocalidad": nombreLocalidad,
        "DescripZona": descripZona,
        "Path": path,
        "ImgFichero": imgFichero,
        "Tipo": tipo,
        "ESTILO": estilo,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
