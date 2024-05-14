// ignore_for_file: constant_identifier_names

import 'dart:convert';

HistoryWeatherResponseModel historyWeatherResponseModelFromJson(String str) => HistoryWeatherResponseModel.fromJson(json.decode(str));

String historyWeatherResponseModelToJson(HistoryWeatherResponseModel data) => json.encode(data.toJson());

class HistoryWeatherResponseModel {
    final String? message;
    final String? cod;
    final int? cityId;
    final double? calctime;
    final int? cnt;
    final List<ListElement>? list;

    HistoryWeatherResponseModel({
        this.message,
        this.cod,
        this.cityId,
        this.calctime,
        this.cnt,
        this.list,
    });

    factory HistoryWeatherResponseModel.fromJson(Map<String, dynamic> json) => HistoryWeatherResponseModel(
        message: json["message"],
        cod: json["cod"],
        cityId: json["city_id"],
        calctime: json["calctime"]?.toDouble(),
        cnt: json["cnt"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "cod": cod,
        "city_id": cityId,
        "calctime": calctime,
        "cnt": cnt,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    final int? dt;
    final MainClass? main;
    final Wind? wind;
    final Clouds? clouds;
    final List<Weather>? weather;

    ListElement({
        this.dt,
        this.main,
        this.wind,
        this.clouds,
        this.weather,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : MainClass.fromJson(json["main"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "wind": wind?.toJson(),
        "clouds": clouds?.toJson(),
        "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
    };
}

class Clouds {
    final int? all;

    Clouds({
        this.all,
    });

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class MainClass {
    final double? temp;
    final double? feelsLike;
    final int? pressure;
    final int? humidity;
    final double? tempMin;
    final double? tempMax;

    MainClass({
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.tempMin,
        this.tempMax,
    });

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "temp_min": tempMin,
        "temp_max": tempMax,
    };
}

class Weather {
    final int? id;
    final MainEnum? main;
    final String? description;
    final String? icon;

    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": description,
        "icon": icon,
    };
}

enum MainEnum {
    CLEAR,
    CLOUDS,
    SMOKE,
    THUNDERSTORM
}

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Smoke": MainEnum.SMOKE,
    "Thunderstorm": MainEnum.THUNDERSTORM
});

class Wind {
    final double? speed;
    final int? deg;
    final double? gust;

    Wind({
        this.speed,
        this.deg,
        this.gust,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
