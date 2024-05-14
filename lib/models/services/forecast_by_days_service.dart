import 'package:dio/dio.dart';
import 'package:laweather/constants/api_key_constant.dart';
import 'package:laweather/helpers/error_handler_helper.dart';
import 'package:laweather/models/forecast_by_days_response_model.dart';
import 'package:laweather/utils/base_url_util.dart';

class ForecastByDaysService {
  static Dio dio = Dio();
  static String weatherApiKey = ApiKeyConstant.openWeatherMap;

  static Future<ForecastByDaysResponseModel> getForecastByDays(
      {String? lat, String? lon}) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.proBaseUrl}/forecast/climate?lat=$lat&lon=$lon&appid=$weatherApiKey&units=metric&cnt=7',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static ForecastByDaysResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return ForecastByDaysResponseModel.fromJson(response.data);
    } else {
      throw ErrorHandlerHelper.mapErrorToMessage(response.statusCode);
    }
  }
}
