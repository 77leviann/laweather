part of 'forecast_by_days_home_content_widget.dart';

class ForecastByDaysHomeItemWidget extends StatelessWidget {
  final ListElement forecastByDaysData;

  const ForecastByDaysHomeItemWidget({
    required this.forecastByDaysData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            CustomDateWidget(
              height: 20,
              width: 40,
              forecastDay: (forecastByDaysData.dt ?? 0) * 1000,
              style: TextStyleConstant.labelLarge(context),
            ),
            ForecastWeatherImageWidget(
                forecastHourlyData: forecastByDaysData, height: 32, width: 32),
            WeatherTemperatureWidget(
              temperature: forecastByDaysData.temp?.day?.toInt() ?? 0,
              style: TextStyleConstant.labelLarge(context),
            )
          ],
        ),
      ),
    );
  }
}
