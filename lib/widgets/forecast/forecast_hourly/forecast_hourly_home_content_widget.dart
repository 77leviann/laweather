import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/models/forecast_hourly_response_model.dart';
import 'package:laweather/widgets/forecast/forecast_hourly/bloc/forecast_hourly_bloc.dart';
import 'package:laweather/widgets/forecast/shimmer/forecast_home_list_shimmer_widget.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/custom_time_widget.dart';
import 'package:laweather/widgets/global/forecast_weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';

part 'forecast_hourly_home_list_widget.dart';
part 'forecast_hourly_home_item_widget.dart';

class ForecastHourlyHomeContentWidget extends StatelessWidget {
  const ForecastHourlyHomeContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastHourlyBloc, ForecastHourlyState>(
      builder: (context, state) {
        if (state is ForecastHourlyLoadingState) {
          BlocProvider.of<ForecastHourlyBloc>(context)
              .add(GetForecastHourlyEvent());
          return const ForecastHomeListShimmerWidget(itemCount: 24);
        } else if (state is ForecastHourlyLoadedState) {
          return ForecastHourlyHomeListWidget(
            forecastHourlyData: state.forecastHourlyData,
          );
        } else {
          return CustomErrorWidget(
            errorState: state as ForecastHourlyErrorState,
          );
        }
      },
    );
  }
}
