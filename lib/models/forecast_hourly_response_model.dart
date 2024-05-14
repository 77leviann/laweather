// ignore_for_file: constant_identifier_names

import 'dart:convert';

ForecastHourlyResponseModel forecastHourlyResponseModelFromJson(String str) => ForecastHourlyResponseModel.fromJson(json.decode(str));

String forecastHourlyResponseModelToJson(ForecastHourlyResponseModel data) => json.encode(data.toJson());

class ForecastHourlyResponseModel {
    final String? cod;
    final int? message;
    final int? cnt;
    final List<ListElement>? list;
    final City? city;

    ForecastHourlyResponseModel({
        this.cod,
        this.message,
        this.cnt,
        this.list,
        this.city,
    });

    factory ForecastHourlyResponseModel.fromJson(Map<String, dynamic> json) => ForecastHourlyResponseModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "city": city?.toJson(),
    };
}

class City {
    final int? id;
    final String? name;
    final Coord? coord;
    final String? country;
    final int? population;
    final int? timezone;
    final int? sunrise;
    final int? sunset;

    City({
        this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Coord {
    final double? lat;
    final double? lon;

    Coord({
        this.lat,
        this.lon,
    });

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    final int? dt;
    final MainClass? main;
    final List<Weather>? weather;
    final Clouds? clouds;
    final Wind? wind;
    final int? visibility;
    final double? pop;
    final Sys? sys;
    final DateTime? dtTxt;
    final Rain? rain;

    ListElement({
        this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : MainClass.fromJson(json["main"]),
        weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
        "rain": rain?.toJson(),
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
    final double? tempMin;
    final double? tempMax;
    final int? pressure;
    final int? seaLevel;
    final int? grndLevel;
    final int? humidity;
    final double? tempKf;

    MainClass({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf,
    });

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class Rain {
    final double? the1H;

    Rain({
        this.the1H,
    });

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H,
    };
}

class Sys {
    final Pod? pod;

    Sys({
        this.pod,
    });

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]]!,
    );

    Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
    };
}

enum Pod {
    D,
    N
}

final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});

class Weather {
    final int? id;
    final MainEnum? main;
    final Description? description;
    final Icon? icon;

    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: descriptionValues.map[json["description"]]!,
        icon: iconValues.map[json["icon"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": iconValues.reverse[icon],
    };
}

enum Description {
    BROKEN_CLOUDS,
    CLEAR_SKY,
    LIGHT_RAIN,
    MODERATE_RAIN,
    OVERCAST_CLOUDS,
    SCATTERED_CLOUDS
}

final descriptionValues = EnumValues({
    "broken clouds": Description.BROKEN_CLOUDS,
    "clear sky": Description.CLEAR_SKY,
    "light rain": Description.LIGHT_RAIN,
    "moderate rain": Description.MODERATE_RAIN,
    "overcast clouds": Description.OVERCAST_CLOUDS,
    "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Icon {
    THE_01_N,
    THE_03_D,
    THE_03_N,
    THE_04_D,
    THE_04_N,
    THE_10_D,
    THE_10_N
}

final iconValues = EnumValues({
    "01n": Icon.THE_01_N,
    "03d": Icon.THE_03_D,
    "03n": Icon.THE_03_N,
    "04d": Icon.THE_04_D,
    "04n": Icon.THE_04_N,
    "10d": Icon.THE_10_D,
    "10n": Icon.THE_10_N
});

enum MainEnum {
    CLEAR,
    CLOUDS,
    RAIN
}

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Rain": MainEnum.RAIN
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
