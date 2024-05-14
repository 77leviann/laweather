part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetailWindWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherDetailWindWidget({
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
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 3.h,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Image.asset(
                  AssetConstant.iconWindPng,
                ),
              ),
              Center(
                child: Text(
                  'Wind',
                  style: TextStyleConstant.labelLarge(context)?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          WeatherWindWidget(
            height: 80.h,
            width: 80.w,
            wind: currentWeatherData.wind?.speed?.toInt() ?? 0,
            style: TextStyleConstant.headlineMedium(context)?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
