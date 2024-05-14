import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherTemperatureWidget extends StatelessWidget {
  final TextStyle? style;
  final int temperature;

  const WeatherTemperatureWidget({
    super.key,
    required this.temperature,
    this.style,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    if (kDebugMode) {
      print('Temperature: $temperature');
    }
    return Text(
      '$temperature °C',
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
