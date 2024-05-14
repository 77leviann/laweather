part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeLocationWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeLocationWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(4.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer,
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2.h),
          ),
          child: Icon(
            Icons.location_on,
            color: Theme.of(
              context,
            ).colorScheme.primary,
          ),
        ),
        SizedBox(width: 8.w),
        Center(
          child: WeatherLocationWidget(
            height: 24.h,
            width: 200.w,
            locationName: currentWeatherData.name ?? '',
            locationCode: currentWeatherData.sys?.country ?? '',
            style: TextStyleConstant.bodyLarge(context),
          ),
        ),
      ],
    );
  }
}
