part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetailHumidityWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherDetailHumidityWidget({
    super.key,
    required this.currentWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      width: 112.w,
      height: 112.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: Theme.of(context).colorScheme.tertiary,
        border: Border.all(
          color: Theme.of(context).colorScheme.onTertiary,
          width: 3.h,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                padding: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.h),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                child: Image.asset(
                  AssetConstant.iconHumidityPng,
                ),
              ),
              Center(
                child: Text(
                  'Humidity',
                  style: TextStyleConstant.labelLarge(context)?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          WeatherHumidityWidget(
            height: 80.h,
            width: 80.w,
            humidity: currentWeatherData.main?.humidity?.toInt() ?? 0,
            style: TextStyleConstant.headlineMedium(context),
          )
        ],
      ),
    );
  }
}
