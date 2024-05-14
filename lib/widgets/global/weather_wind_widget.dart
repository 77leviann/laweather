import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherWindWidget extends StatelessWidget {
  final dynamic style;
  final int wind;
  final double height;
  final double width;

  const WeatherWindWidget({
    super.key,
    required this.wind,
    this.style,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Wind: $wind');
    }
    return Text(
      '$wind m/s',
      style: style,
    );
  }
}
