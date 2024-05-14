part of 'home_screen.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
          ),
          child: Column(
            children: [
              const CurrentWeatherHomeContentWidget(),
              SizedBox(height: 16.h),
              const ForecastHomeContentWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
