import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/models/forecast_by_days_response_model.dart';
import 'package:laweather/widgets/forecast/forecast_by_days/bloc/forecast_by_days_bloc.dart';
import 'package:laweather/widgets/forecast/shimmer/forecast_home_list_shimmer_widget.dart';
import 'package:laweather/widgets/global/custom_date_widget.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/forecast_weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';

part 'forecast_by_days_home_list_widget.dart';
part 'forecast_by_days_home_item_widget.dart';

class ForecastByDaysHomeContentWidget extends StatelessWidget {
  const ForecastByDaysHomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastByDaysBloc, ForecastByDaysState>(
      builder: (context, state) {
        if (state is ForecastByDaysLoadingState) {
          BlocProvider.of<ForecastByDaysBloc>(context)
              .add(GetForecastByDaysEvent());
          return const ForecastHomeListShimmerWidget(itemCount: 7);
        } else if (state is ForecastByDaysLoadedState) {
          return ForecastByDaysHomeListWidget(
            forecastByDaysData: state.forecastByDaysData,
          );
        } else {
          return CustomErrorWidget(
            errorState: state as ForecastByDaysErrorState,
          );
        }
      },
    );
  }
}
