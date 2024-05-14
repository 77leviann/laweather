part of 'current_weather_detail_content_widget.dart';

class CurrentWeatherDetailContainerWidget extends StatelessWidget {
  final dynamic currentWeatherData;

  const CurrentWeatherDetailContainerWidget({
    required this.currentWeatherData,
    super.key,
  });

  @override
  Widget build(
    BuildContext context
  ) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.h),
            color: Theme.of(context).colorScheme.primaryContainer,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2.h,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Column(
              children: [
                CurrentWeatherDetailDescriptionWidget(
                  currentWeatherData: currentWeatherData,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CurrentWeatheDetailImageWidget(
                      currentWeatherData: currentWeatherData,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        height: 160.h,
                        width: 160.h,
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 3.h,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CurrentWeatherDetaiTemperatureWidget(
                              currentWeatherData: currentWeatherData,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(child: AirPollutionDetailContentWidget()),
                                SizedBox(width: 8.w),
                                CurrentWeatherDetailTemperatureHighLowWidget(
                                  currentWeatherData: currentWeatherData,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(16.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3.h,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CurrentWeatherDetailWindWidget(
                        currentWeatherData: currentWeatherData,
                      ),
                      CurrentWeatherDetailHumidityWidget(
                        currentWeatherData: currentWeatherData,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
