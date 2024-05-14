import 'package:dio/dio.dart';
import 'package:laweather/constants/api_key_constant.dart';
import 'package:laweather/helpers/error_handler_helper.dart';
import 'package:laweather/models/current_weather_response_model.dart';
import 'package:laweather/utils/base_url_util.dart';

class WeatherService {
  static Dio dio = Dio();
  static String weatherApiKey = ApiKeyConstant.openWeatherMap;

  static Future<CurrentWeatherResponseModel> getCurrentWeather(
      {String? lat, String? lon}) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.proBaseUrl}/weather?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static Future<CurrentWeatherResponseModel> getCurrentWeatherBySearchLocation(
      String location) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.proBaseUrl}/weather?q=$location&appid=$weatherApiKey&units=metric',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static CurrentWeatherResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return CurrentWeatherResponseModel.fromJson(response.data);
    } else {
      throw ErrorHandlerHelper.mapErrorToMessage(response.statusCode);
    }
  }
}
