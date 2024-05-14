part of 'current_weather_home_shimmer_container_widget.dart';

class CurrentWeatherHomeTemperatureHighLowShimmerWidget
    extends StatelessWidget {
  const CurrentWeatherHomeTemperatureHighLowShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 90.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: Center(
        child: CustomShimmerWidget(
          child: Container(
            height: 60.h,
            width: 70.w,
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
      ),
    );
  }
}
