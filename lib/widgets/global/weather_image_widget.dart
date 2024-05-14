import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/weather_condition_constant.dart';

class WeatherImageWidget extends StatelessWidget {
  final String description;
  final double? width;
  final double? height;

  const WeatherImageWidget({
    required this.description,
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Description: $description');
    }
    return Image.asset(
      WeatherCondition.getWeatherIconPath(description),
      width: width ?? 50.w,
      height: height ?? 50.h,
    );
  }
}
