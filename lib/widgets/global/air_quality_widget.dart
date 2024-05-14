import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laweather/constants/air_quality_constant.dart';

class AirQualityWidget extends StatelessWidget {
  final dynamic style;
  final int airQuality;
  final double height;
  final double width;

  const AirQualityWidget({
    super.key,
    required this.airQuality,
    required this.style,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Air Quality Index: $airQuality');
    }
    String airQualityText =
        AirQualityConstant.airQuality(airQuality.toString());
    return Text(
      airQualityText,
      style: style,
    );
  }
}
