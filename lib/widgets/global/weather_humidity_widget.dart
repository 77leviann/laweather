import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherHumidityWidget extends StatelessWidget {
  final dynamic style;
  final int humidity;
  final double height;
  final double width;

  const WeatherHumidityWidget({
    super.key,
    required this.humidity,
    this.style,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Humidity: $humidity');
    }
    return Text(
      '$humidity %',
      style: style,
    );
  }
}
