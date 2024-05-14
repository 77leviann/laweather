import 'package:laweather/constants/asset_constant.dart';

class WeatherCondition {
  static Map<String, String> weatherIconMap = {
    'thunderstorm with light rain':
        AssetConstant.iconCloudyRainyThunderstromV3Png,
    'thunderstorm with rain': AssetConstant.iconCloudyRainyThunderstromV2Png,
    'thunderstorm with heavy rain':
        AssetConstant.iconCloudyRainyThunderstromV2Png,
    'light thunderstorm': AssetConstant.iconCloudyRainyThunderstromV3Png,
    'thunderstorm': AssetConstant.iconCloudyRainyThunderstromV3Png,
    'heavy thunderstorm': AssetConstant.iconCloudyRainyThunderstromPng,
    'ragged thunderstorm': AssetConstant.iconCloudyRainyThunderstromV3Png,
    'thunderstorm with light drizzle':
        AssetConstant.iconCloudyRainyThunderstromV2Png,
    'thunderstorm with drizzle': AssetConstant.iconCloudyRainyThunderstromV2Png,
    'thunderstorm with heavy drizzle':
        AssetConstant.iconCloudyRainyThunderstromV2Png,
    'light intensity drizzle': AssetConstant.iconRainPng,
    'drizzle': AssetConstant.iconRainPng,
    'heavy intensity drizzle': AssetConstant.iconRainPng,
    'light intensity drizzle rain': AssetConstant.iconRainPng,
    'drizzle rain': AssetConstant.iconCloudyRainyPng,
    'heavy intensity drizzle rain': AssetConstant.iconCloudyRainyPng,
    'shower rain and drizzle': AssetConstant.iconCloudyRainyPng,
    'heavy shower rain and drizzle': AssetConstant.iconCloudyRainyV2Png,
    'shower drizzle': AssetConstant.iconCloudyRainyV2Png,
    'light rain': AssetConstant.iconCloudyRainyPng,
    'moderate rain': AssetConstant.iconCloudyRainyPng,
    'heavy intensity rain': AssetConstant.iconCloudyRainyPng,
    'very heavy rain': AssetConstant.iconCloudyRainyV3Png,
    'extreme rain': AssetConstant.iconCloudyRainyV3Png,
    'freezing rain': AssetConstant.iconCloudySnowV3Png,
    'light intensity shower rain': AssetConstant.iconCloudyRainyV2Png,
    'shower rain': AssetConstant.iconCloudyRainyV2Png,
    'heavy intensity shower rain': AssetConstant.iconCloudyRainyV3Png,
    'ragged shower rain': AssetConstant.iconCloudyRainyV2Png,
    'light snow': AssetConstant.iconCloudySnowPng,
    'snow': AssetConstant.iconCloudySnowPng,
    'heavy snow': AssetConstant.iconCloudySnowPng,
    'sleet': AssetConstant.iconCloudySnowPng,
    'light shower sleet': AssetConstant.iconCloudySnowV2Png,
    'shower sleet': AssetConstant.iconCloudySnowV2Png,
    'light rain and snow': AssetConstant.iconCloudySnowV2Png,
    'rain and snow': AssetConstant.iconCloudySnowV3Png,
    'light shower snow': AssetConstant.iconCloudySnowV3Png,
    'shower snow': AssetConstant.iconCloudySnowV3Png,
    'heavy shower snow': AssetConstant.iconCloudySnowV3Png,
    'mist': AssetConstant.iconCloudyMistDayPng,
    'smoke': AssetConstant.iconCloudyMistDayPng,
    'haze': AssetConstant.iconCloudyMistDayPng,
    'sand, dust whirls': AssetConstant.iconCloudyMistDayPng,
    'fog': AssetConstant.iconCloudyMistDayPng,
    'sand': AssetConstant.iconCloudyMistDayPng,
    'dust': AssetConstant.iconCloudyMistDayPng,
    'volcanic ash': AssetConstant.iconCloudyMistDayPng,
    'squalls': AssetConstant.iconCloudyMistDayPng,
    'tornado': AssetConstant.iconTornadoPng,
    'clear sky': AssetConstant.iconCloudyDayV3Png,
    'few clouds': AssetConstant.iconCloudyDayV3Png,
    'scattered clouds': AssetConstant.iconCloudyDayV3Png,
    'broken clouds': AssetConstant.iconCloudyDayV2Png,
    'overcast clouds': AssetConstant.iconCloudyDayV2Png,
  };

  static String getWeatherIconPath(String weatherDescription) {
    return weatherIconMap.containsKey(weatherDescription)
        ? weatherIconMap[weatherDescription]!
        : AssetConstant.iconWeatherDefaultPng;
  }
}
