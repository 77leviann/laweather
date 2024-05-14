part of 'forecast_hourly_home_content_widget.dart';

class ForecastHourlyHomeItemWidget extends StatelessWidget {
  final ListElement forecastHourlyData;

  const ForecastHourlyHomeItemWidget({
    super.key,
    required this.forecastHourlyData,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 66,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 3.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTimeWidget(
              height: 20,
              width: 40,
              forecastTime: forecastHourlyData.dtTxt ?? DateTime.now(),
              style: TextStyleConstant.labelLarge(context),
            ),
            ForecastWeatherImageWidget(
              forecastHourlyData: forecastHourlyData,
              height: 32,
              width: 32,
            ),
            WeatherTemperatureWidget(
              temperature: forecastHourlyData.main?.temp?.toInt() ?? 0,
              style: TextStyleConstant.labelLarge(context),
            ),
          ],
        ),
      ),
    );
  }
}
