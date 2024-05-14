
import 'dart:convert';

AirPollutionResponseModel airPollutionResponseModelFromJson(String str) =>
    AirPollutionResponseModel.fromJson(json.decode(str));

String airPollutionResponseModelToJson(AirPollutionResponseModel data) =>
    json.encode(data.toJson());

class AirPollutionResponseModel {
  final Coord? coord;
  final List<ListElement>? list;

  AirPollutionResponseModel({
    this.coord,
    this.list,
  });

  factory AirPollutionResponseModel.fromJson(Map<String, dynamic> json) {
    return AirPollutionResponseModel(
      coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
      list: json["list"] == null
          ? []
          : List<ListElement>.from(
              json["list"].map((x) => ListElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "coord": coord?.toJson(),
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };

  List<Map<String, double>> get allComponents {
    return list?.map((element) => element.components ?? {}).toList() ?? [];
  }
}

class Coord {
  final int? lon;
  final int? lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class ListElement {
  final Main? main;
  final Map<String, double>? components;
  final int? dt;

  ListElement({
    this.main,
    this.components,
    this.dt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        components: json["components"] == null
            ? null
            : Map<String, double>.from(
                json["components"].map((k, v) => MapEntry<String, double>(
                      k,
                      v.toDouble(),
                    ))),
        dt: json["dt"],
      );

  Map<String, dynamic> toJson() => {
        "main": main?.toJson(),
        "components": components == null
            ? null
            : Map.from(components!).map(
                (k, v) => MapEntry<String, dynamic>(k, v),
              ),
        "dt": dt,
      };
}

class Main {
  final int? aqi;

  Main({
    this.aqi,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        aqi: json["aqi"],
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
      };
}
