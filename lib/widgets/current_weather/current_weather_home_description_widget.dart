part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeDescriptionWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeDescriptionWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherDescriptionWidget(
      height: 24.h,
      width: 240.w,
      description: currentWeatherData.weather?.first.description ?? '',
      style: TextStyleConstant.bodyLarge(context),
    );
  }
}
