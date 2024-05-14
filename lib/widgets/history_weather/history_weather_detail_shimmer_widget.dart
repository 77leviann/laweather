part of 'history_weather_detail_content_widget.dart';

class HistoryWeatherDetailShimmerWidget extends StatelessWidget {
  const HistoryWeatherDetailShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.h),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3.h,
        ),
      ),
      child: CustomShimmerWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Latest Weather',
              style: TextStyleConstant.labelLarge(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 50.w,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
                SizedBox(width: 16.w),
                Container(
                  height: 40.h,
                  width: 50.w,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Center(
              child: Container(
                height: 16.h,
                width: 160.w,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
