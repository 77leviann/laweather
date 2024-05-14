import 'package:flutter/material.dart';
import 'package:laweather/helpers/string_format_helper.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final String description;
  final TextStyle? style;
  final double height;
  final double width;

  const WeatherDescriptionWidget({
    required this.description,
    this.style,
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String weatherDescription = description;
    return Text(
      overflow: TextOverflow.ellipsis,
      StringFormatHelper.capitalizeDescription(
        weatherDescription,
      ),
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
