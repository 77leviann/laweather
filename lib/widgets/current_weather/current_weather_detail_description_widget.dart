part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetailDescriptionWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherDetailDescriptionWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 64.h,
        child: Center(
          child: WeatherDescriptionWidget(
            height: 24.h,
            width: 160.w,
            description: currentWeatherData.weather?.first.description ?? '',
            style: TextStyleConstant.headlineMedium(context),
          ),
        ),
      ),
    );
  }
}
