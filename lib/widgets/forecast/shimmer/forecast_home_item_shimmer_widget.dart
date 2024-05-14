part of 'forecast_home_list_shimmer_widget.dart';

class ForecastHomeItemShimmerWidget extends StatelessWidget {
  const ForecastHomeItemShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        width: 66,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 3.h),
        ),
        child: CustomShimmerWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 40,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              Container(
                height: 32,
                width: 32,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              Container(
                height: 20,
                width: 40,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
