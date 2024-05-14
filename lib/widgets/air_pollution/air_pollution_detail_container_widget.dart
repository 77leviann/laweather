part of 'air_pollution_detail_content_widget.dart';

class AirPollutionDetailContainerWidget extends StatelessWidget {
  final dynamic airPollutionData;

  const AirPollutionDetailContainerWidget({
    super.key,
    required this.airPollutionData,
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
          color: Theme.of(context).colorScheme.secondary),
      child: Center(
        child: AirQualityWidget(
          height: 24.h,
          width: 60.w,
          airQuality: airPollutionData.list?.first.main?.aqi,
          style: TextStyleConstant.labelLarge(context),
        ),
      ),
    );
  }
}



