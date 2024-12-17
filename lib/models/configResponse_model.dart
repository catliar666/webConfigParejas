// To parse this JSON data, do
//
//     final configResponse = configResponseFromJson(jsonString);

import 'dart:convert';

ConfigResponse configResponseFromJson(String str) =>
    ConfigResponse.fromJson(json.decode(str));

String configResponseToJson(ConfigResponse data) => json.encode(data.toJson());

class ConfigResponse {
  String? id;
  int anio;
  String autores;
  String curso;
  bool splashScreen;

  ConfigResponse({
    required this.anio,
    required this.autores,
    required this.curso,
    required this.splashScreen,
  });

  factory ConfigResponse.fromJson(Map<String, dynamic> json) => ConfigResponse(
        anio: json["anio"],
        autores: json["autores"],
        curso: json["curso"],
        splashScreen: json["splashScreen"],
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "autores": autores,
        "curso": curso,
        "splashScreen": splashScreen,
      };
}
