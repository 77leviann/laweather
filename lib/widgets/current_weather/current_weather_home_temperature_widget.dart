part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeTemperatureWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeTemperatureWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 180.w,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
            color: Theme.of(context).colorScheme.primary, width: 4.h),
      ),
      child: Center(
          child: WeatherTemperatureWidget(
        temperature: currentWeatherData.main?.temp?.toInt() ?? 0,
        style: TextStyleConstant.displayMedium(context),
      )),
    );
  }
}
