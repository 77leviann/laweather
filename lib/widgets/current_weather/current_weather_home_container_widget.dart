part of 'current_weather_home_content_widget.dart';

class CurrentWeatherHomeContainerWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherHomeContainerWidget({
    required this.currentWeatherData,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12.h),
        CurrentWeatherHomeLocationWidget(
          currentWeatherData: currentWeatherData,
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.h),
            color: Theme.of(context).colorScheme.inversePrimary,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 2.h,
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: CurrentWeatherHomeTemperatureWidget(
                      currentWeatherData: currentWeatherData,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: CurrentWeatherHomeTemperatureHighLowWidget(
                      currentWeatherData: currentWeatherData,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CurrentWeatherHomeImageWidget(
                currentWeatherData: currentWeatherData,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
