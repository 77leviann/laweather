part of 'forecast_by_days_home_content_widget.dart';

class ForecastByDaysHomeListWidget extends StatelessWidget {
  final ForecastByDaysResponseModel? forecastByDaysData;

  const ForecastByDaysHomeListWidget({
    required this.forecastByDaysData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: forecastByDaysData?.list?.length ?? 0,
        itemBuilder: (context, index) {
          final forecastByDaysDataItem = forecastByDaysData?.list?[index];
          return ForecastByDaysHomeItemWidget(
            forecastByDaysData: forecastByDaysDataItem ?? ListElement(),
          );
        },
      ),
    );
  }
}
