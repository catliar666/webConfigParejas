// To parse this JSON data, do
//
//     final appbarResponse = appbarResponseFromJson(jsonString);

import 'dart:convert';

AppbarResponse appbarResponseFromJson(String str) =>
    AppbarResponse.fromJson(json.decode(str));

String appbarResponseToJson(AppbarResponse data) => json.encode(data.toJson());

class AppbarResponse {
  String? id;
  String titulo;

  AppbarResponse({
    required this.titulo,
  });

  factory AppbarResponse.fromJson(Map<String, dynamic> json) => AppbarResponse(
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
      };
}
