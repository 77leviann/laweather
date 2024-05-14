import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/widgets/global/weather_location_widget.dart';
import 'package:laweather/widgets/global/weather_description_widget.dart';
import 'package:laweather/widgets/global/weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';

class CustomSearchLocationListTileWidget extends StatelessWidget {
  final String locationName;
  final String locationCode;
  final String weatherDescription;
  final double temperature;

  const CustomSearchLocationListTileWidget({
    required this.locationName,
    required this.locationCode,
    required this.weatherDescription,
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.h),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.h),
      selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
      tileColor: Theme.of(context).colorScheme.surfaceVariant,
      leading: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.h),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: WeatherImageWidget(
          height: 24.h,
          width: 24.w,
          description: weatherDescription,
        ),
      ),
      title: WeatherLocationWidget(
        locationName: locationName,
        locationCode: locationCode,
        height: 24.h,
        width: 140.w,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: WeatherDescriptionWidget(
        height: 24.h,
        width: 240.w,
        description: weatherDescription,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      trailing: WeatherTemperatureWidget(
        temperature: temperature.toInt(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
