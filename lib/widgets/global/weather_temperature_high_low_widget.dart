import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/asset_constant.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';

class WeatherTemperatureHighLowWidget extends StatelessWidget {
  final int temperatureMin;
  final int temperatureMax;
  final TextStyle? style;
  final double? widthIcon;
  final double? heightIcon;

  const WeatherTemperatureHighLowWidget({
    super.key,
    this.style,
    this.widthIcon,
    this.heightIcon,
    required this.temperatureMin,
    required this.temperatureMax,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    if (kDebugMode) {
      print('Temperature min | max: $temperatureMin | $temperatureMax');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              AssetConstant.iconTemperatureLowV2Png,
              width: widthIcon ?? 24.w,
              height: heightIcon ?? 24.h,
            ),
            WeatherTemperatureWidget(
              temperature: temperatureMin,
              style: style ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Image.asset(
              AssetConstant.iconTemperatureHeightV2Png,
              width: widthIcon ?? 24.w,
              height: heightIcon ?? 24.h,
            ),
            WeatherTemperatureWidget(
              temperature: temperatureMax,
              style: style ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
