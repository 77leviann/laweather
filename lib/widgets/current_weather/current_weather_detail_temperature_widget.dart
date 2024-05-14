part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetaiTemperatureWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherDetaiTemperatureWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 138.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: Center(
        child: WeatherTemperatureWidget(
          temperature: currentWeatherData.main?.temp?.toInt() ?? 0,
          style: TextStyleConstant.headlineMedium(context),
        ),
      ),
    );
  }
}
