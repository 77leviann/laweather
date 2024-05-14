part of 'current_weather_home_shimmer_container_widget.dart';

class CurrentWeatherHomeTemperatureShimmerWidget extends StatelessWidget {
  const CurrentWeatherHomeTemperatureShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 180.w,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        color: Theme.of(
          context,
        ).colorScheme.secondary,
        border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.primary,
            width: 4.h),
      ),
      child: Center(
        child: CustomShimmerWidget(
          child: Container(
            height: 60.h,
            width: 160.w,
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant,
          ),
        ),
      ),
    );
  }
}
