// To parse this JSON data, do
//
//     final themeResponse = themeResponseFromJson(jsonString);

import 'dart:convert';

ThemeResponse themeResponseFromJson(String str) => ThemeResponse.fromJson(json.decode(str));

String themeResponseToJson(ThemeResponse data) => json.encode(data.toJson());

class ThemeResponse {
    Data? data;

    ThemeResponse({
        this.data,
    });

    factory ThemeResponse.fromJson(Map<String, dynamic> json) => ThemeResponse(
        data: json["3453245324"] == null ? null : Data.fromJson(json["3453245324"]),
    );

    Map<String, dynamic> toJson() => {
        "3453245324": data?.toJson(),
    };
}

class Data {
    String? id;
    String? color;
    bool? oscuro;
    int? tamanioLetra;

    Data({
        this.color,
        this.oscuro,
        this.tamanioLetra,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        oscuro: json["oscuro"],
        tamanioLetra: json["tamanioLetra"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "oscuro": oscuro,
        "tamanioLetra": tamanioLetra,
    };
}
