import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laweather/helpers/string_format_helper.dart';
import 'package:laweather/widgets/global/weather_image_widget.dart';

class ForecastWeatherImageWidget extends StatelessWidget {
  final dynamic forecastHourlyData;
  final double height;
  final double width;

  const ForecastWeatherImageWidget({
    super.key,
    required this.forecastHourlyData,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        'Description: ${StringFormatHelper.formatForecastDescription(
          forecastHourlyData.weather?.first.description.toString() ?? ''
        )}',
      );
    }
    return WeatherImageWidget(
      description: StringFormatHelper.formatForecastDescription(
        forecastHourlyData.weather?.first.description.toString() ?? '',
      ),
    );
  }
}
