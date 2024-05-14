import 'package:dio/dio.dart';
import 'package:laweather/constants/api_key_constant.dart';
import 'package:laweather/helpers/error_handler_helper.dart';
import 'package:laweather/models/air_pollution_response_model.dart';
import 'package:laweather/utils/base_url_util.dart';

class AirPollutionService {
  static Dio dio = Dio();
  static String weatherApiKey = ApiKeyConstant.openWeatherMap;

  static Future<AirPollutionResponseModel> getAirPollution(
      {String? lat, String? lon}) async {
    try {
      final response = await dio.get(
        '${BaseUrlUtil.airPollutionUrl}/air_pollution?lat=$lat&lon=$lon&appid=$weatherApiKey',
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandlerHelper.handleError(e);
    }
  }

  static AirPollutionResponseModel _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return AirPollutionResponseModel.fromJson(response.data);
    } else {
      throw ErrorHandlerHelper.mapErrorToMessage(response.statusCode);
    }
  }
}
