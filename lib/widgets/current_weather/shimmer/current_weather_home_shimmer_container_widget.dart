import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/widgets/global/custom_shimmer_widget.dart';

part 'current_weather_home_description_shimmer_widget.dart';
part 'current_weather_home_image_shimmer_widget.dart';
part 'current_weather_home_location_shimmer_widget.dart';
part 'current_weather_home_temperature_high_low_shimmer_widget.dart';
part 'current_weather_home_temperature_shimmer_widget.dart';

class CurrentWeatherHomeContainerShimmerWidget extends StatelessWidget {
  const CurrentWeatherHomeContainerShimmerWidget({ super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        const CurrentWeatherHomeLocationShimmerWidget(),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.h),
            color: Theme.of(context).colorScheme.inversePrimary,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline, width: 4.h),
          ),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CurrentWeatherHomeTemperatureShimmerWidget(),
                  CurrentWeatherHomeTemperatureHighLowShimmerWidget(),
                ],
              ),
              SizedBox(height: 16.h),
              const CurrentWeatherHomeImageShimmerWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
