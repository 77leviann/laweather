import 'package:dio/dio.dart';
import 'package:laweather/constants/api_key_constant.dart';
import 'package:laweather/helpers/error_handler_helper.dart';
import 'package:laweather/models/history_weather_response_model.dart';
import 'package:laweather/utils/base_url_util.dart';

class HistoryWeatherService {
  static Dio dio = Dio();
  static String weatherApiKey = ApiKeyConstant.openWeatherMap;

  static Future<HistoryWeatherResponseModel> getHistoryWeather(
      {String? lat, String? lon}) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.historyUrl}/history/city?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric&cnt=1',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static HistoryWeatherResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return HistoryWeatherResponseModel.fromJson(response.data);
    } else {
      throw ErrorHandlerHelper.mapErrorToMessage(response.statusCode);
    }
  }
}
