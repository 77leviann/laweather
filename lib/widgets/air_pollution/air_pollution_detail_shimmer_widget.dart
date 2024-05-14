part of 'air_pollution_detail_content_widget.dart';

class AirPollutionDetailShimmerWidget extends StatelessWidget {
  const AirPollutionDetailShimmerWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 64.h,
      width: 55.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: Theme.of(context).colorScheme.surfaceVariant),
      child: Center(
        child: CustomShimmerWidget(
          child: Container(
              height: 24.h,
              width: 60.w,
              color: Theme.of(context).colorScheme.surfaceVariant),
        ),
      ),
    );
  }
}
