import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_bloc.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_event.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_state.dart';
import 'package:laweather/widgets/forecast/forecast_by_days/forecast_by_days_home_content_widget.dart';
import 'package:laweather/widgets/forecast/forecast_hourly/forecast_hourly_home_content_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

part 'forecast_home_button_widget.dart';

class ForecastHomeContentWidget extends StatelessWidget {
  const ForecastHomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForecastWidgetBloc(),
      child: Container(
        height: 252,
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.h),
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2.h,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ForecastHomeButtonWidget(),
            BlocBuilder<ForecastWidgetBloc, ForecastWidgetState>(
              builder: (context, state) {
                if (state is Forecast24HoursState) {
                  return const ForecastHourlyHomeContentWidget();
                } else if (state is Forecast7DaysState) {
                  return const ForecastByDaysHomeContentWidget();
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
