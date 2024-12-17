// To parse this JSON data, do
//
//     final rutasResponse = rutasResponseFromJson(jsonString);

import 'dart:convert';

Map<String, RutasResponse> rutasResponseFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, RutasResponse>(k, RutasResponse.fromJson(v)));

String rutasResponseToJson(Map<String, RutasResponse> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class RutasResponse {
  String? id;
  bool activo;
  String nombre;

  RutasResponse({
    required this.activo,
    required this.nombre,
  });

  factory RutasResponse.fromJson(Map<String, dynamic> json) => RutasResponse(
        activo: json["activo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "activo": activo,
        "nombre": nombre,
      };
}
