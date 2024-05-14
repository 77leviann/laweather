part of 'current_weather_home_shimmer_container_widget.dart';

class CurrentWeatherHomeImageShimmerWidget extends StatelessWidget {
  const CurrentWeatherHomeImageShimmerWidget({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return CustomShimmerWidget(
      child: Container(
        height: 200.h,
        width: 200.w,
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
    );
  }
}
