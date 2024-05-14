part of 'forecast_hourly_home_content_widget.dart';

class ForecastHourlyHomeListWidget extends StatelessWidget {
  final ForecastHourlyResponseModel? forecastHourlyData;

  const ForecastHourlyHomeListWidget({
    super.key,
    required this.forecastHourlyData,
  });

  @override
  Widget build(BuildContext context) {
    if (forecastHourlyData?.list == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: forecastHourlyData?.list?.length ?? 0,
        itemBuilder: (context, index) {
          final forecastHourlyDataItem = forecastHourlyData?.list?[index];
          return ForecastHourlyHomeItemWidget(
            forecastHourlyData: forecastHourlyDataItem ?? ListElement(),
          );
        },
      ),
    );
  }
}
