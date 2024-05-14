part of 'history_weather_detail_content_widget.dart';

class HistoryWeatherDetailContainerWidget extends StatelessWidget {
  final dynamic historyWeatherData;

  const HistoryWeatherDetailContainerWidget({
    super.key,
    required this.historyWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Latest Weather',
            style: TextStyleConstant.labelLarge(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WeatherImageWidget(
                description:
                    historyWeatherData.list.first.weather.first.description ??
                        '',
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              WeatherTemperatureWidget(
                temperature:
                    historyWeatherData.list.first.main.temp.toInt() ?? 0,
                style: TextStyleConstant.headlineMedium(context),
              ),
            ],
          ),
          WeatherDescriptionWidget(
            height: 24.h,
            width: 160.w,
            description:
                historyWeatherData.list.first.weather.first.description ??
                    '',
            style: TextStyleConstant.labelLarge(context),
          ),
        ],
      ),
    );
  }
}
