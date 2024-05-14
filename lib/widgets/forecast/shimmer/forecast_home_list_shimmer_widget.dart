import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/widgets/global/custom_shimmer_widget.dart';

part 'forecast_home_item_shimmer_widget.dart';

class ForecastHomeListShimmerWidget extends StatelessWidget {
  final int? itemCount;

  const ForecastHomeListShimmerWidget({
    super.key,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const ForecastHomeItemShimmerWidget();
        },
      ),
    );
  }
}
