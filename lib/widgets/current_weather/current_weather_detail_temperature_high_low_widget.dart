part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetailTemperatureHighLowWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherDetailTemperatureHighLowWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 54.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: WeatherTemperatureHighLowWidget(
        temperatureMin: currentWeatherData.main?.tempMin?.toInt() ?? 0,
        temperatureMax: currentWeatherData.main?.tempMax?.toInt() ?? 0,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
        heightIcon: 16.h,
        widthIcon: 16.w,
      ),
    );
  }
}
