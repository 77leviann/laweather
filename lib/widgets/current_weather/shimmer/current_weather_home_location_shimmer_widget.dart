part of 'current_weather_home_shimmer_container_widget.dart';

class CurrentWeatherHomeLocationShimmerWidget extends StatelessWidget {
  const CurrentWeatherHomeLocationShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(4.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondaryContainer,
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2.h),
          ),
          child: Icon(
            Icons.location_on,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: 8.w),
        CustomShimmerWidget(
          child: Container(
            height: 24.h,
            width: 200.w,
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
      ],
    );
  }
}
