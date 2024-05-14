import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/name_routes_constant.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/models/current_weather_response_model.dart';
import 'package:laweather/widgets/current_weather/bloc/current_weather_bloc.dart';
import 'package:laweather/widgets/current_weather/shimmer/current_weather_home_shimmer_container_widget.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/weather_description_widget.dart';
import 'package:laweather/widgets/global/weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_location_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_high_low_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';

part 'current_weather_home_container_widget.dart';
part 'current_weather_home_location_widget.dart';
part 'current_weather_home_temperature_widget.dart';
part 'current_weather_home_temperature_high_low_widget.dart';
part 'current_weather_home_image_widget.dart';
part 'current_weather_home_description_widget.dart';

class CurrentWeatherHomeContentWidget extends StatelessWidget {
  const CurrentWeatherHomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherLoadingState) {
          BlocProvider.of<CurrentWeatherBloc>(context)
              .add(GetWeatherByLocationEvent());
          return const CurrentWeatherHomeContainerShimmerWidget();
        } else if (state is CurrentWeatherLoadedState) {
          return CurrentWeatherHomeContainerWidget(
            currentWeatherData: state.currentWeatherData,
          );
        } else {
          return CustomErrorWidget(
            errorState: state as CurrentWeatherErrorState,
          );
        }
      },
    );
  }
}
