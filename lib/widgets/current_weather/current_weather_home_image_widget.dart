part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeImageWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeImageWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => Navigator.pushNamed(context, NameRoutes.detailScreen),
      child: WeatherImageWidget(
        description: currentWeatherData.weather?.first.description ?? '',
        height: 200.h,
        width: 200.w,
      ),
    );
  }
}
