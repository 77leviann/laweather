import 'package:dio/dio.dart';
import 'package:laweather/constants/api_key_constant.dart';
import 'package:laweather/helpers/error_handler_helper.dart';
import 'package:laweather/models/forecast_hourly_response_model.dart';
import 'package:laweather/utils/base_url_util.dart';

class ForecastHourlyService {
  static Dio dio = Dio();
  static String weatherApiKey = ApiKeyConstant.openWeatherMap;

  static Future<ForecastHourlyResponseModel> getForecastHourly(
      {String? lat, String? lon}) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.proBaseUrl}/forecast/hourly?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric&cnt=24',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static ForecastHourlyResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return ForecastHourlyResponseModel.fromJson(response.data);
    } else {
      throw ErrorHandlerHelper.mapErrorToMessage(response.statusCode);
    }
  }
}
