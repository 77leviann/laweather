import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laweather/helpers/date_format_helper.dart';

class CustomDateWidget extends StatelessWidget {
  final dynamic forecastDay;
  final dynamic style;
  final double height;
  final double width;

  const CustomDateWidget({
    super.key,
    required this.forecastDay,
    required this.style,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Day: $forecastDay');
    }
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastDay);
    final String formatToDay = DateFormatHelper.formatToDay(date);
    return Text(
      formatToDay,
      style: style,
    );
  }
}
