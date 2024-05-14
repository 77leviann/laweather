part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeTemperatureHighLowWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeTemperatureHighLowWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24.h,
        ),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
            color: Theme.of(context).colorScheme.primary, width: 3.h),
      ),
      child: Center(
        child: WeatherTemperatureHighLowWidget(
          temperatureMin: currentWeatherData.main?.tempMin?.toInt() ?? 0,
          temperatureMax: currentWeatherData.main?.tempMax?.toInt() ?? 0,
          style: TextStyleConstant.labelLarge(context),
        ),
      ),
    );
  }
}
