part of 'current_weather_detail_content_widget.dart';

class CurrentWeatheDetailImageWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatheDetailImageWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 90.w,
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: WeatherImageWidget(
        description: currentWeatherData.weather?.first.description ?? '',
        height: 80.h,
        width: 80.w,
      ),
    );
  }
}
