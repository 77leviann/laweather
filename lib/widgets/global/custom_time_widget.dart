import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laweather/helpers/date_format_helper.dart';

class CustomTimeWidget extends StatelessWidget {
  final DateTime forecastTime;
  final dynamic style;
  final double height;
  final double width;

  const CustomTimeWidget({
    super.key,
    required this.forecastTime,
    required this.style,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Time: $forecastTime');
    }
    final formatToGMT7 = DateFormatHelper.formatToGMT7(forecastTime);
    return Text(
      formatToGMT7,
      style: style,
    );
  }
}
