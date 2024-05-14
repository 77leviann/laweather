import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/custom_shimmer_widget.dart';
import 'package:laweather/widgets/global/weather_description_widget.dart';
import 'package:laweather/widgets/global/weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';
import 'package:laweather/widgets/history_weather/bloc/history_weather_bloc.dart';

part 'history_weather_detail_container_widget.dart';
part 'history_weather_detail_shimmer_widget.dart';

class HistoryWeatherDetailContentWidget extends StatelessWidget {
  const HistoryWeatherDetailContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryWeatherBloc, HistoryWeatherState>(
      builder: (context, state) {
        if (state is HistoryWeatherLoading) {
          BlocProvider.of<HistoryWeatherBloc>(context)
              .add(GetHistoryWeatherEvent());
          return const HistoryWeatherDetailShimmerWidget();
        } else if (state is HistoryWeatherLoaded) {
          return HistoryWeatherDetailContainerWidget(
              historyWeatherData: state.historyWeatherData);
        } else {
          return CustomErrorWidget(errorState: state as HistoryWeatherError);
        }
      },
    );
  }
}
