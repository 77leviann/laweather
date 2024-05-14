part of 'current_weather_home_shimmer_container_widget.dart';

class CurrentWeatherHomeDescriptionShimmerWidget extends StatelessWidget {
  const CurrentWeatherHomeDescriptionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Container(
        height: 90.h,
        width: 260.w,
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
    );
  }
}
