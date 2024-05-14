import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/asset_constant.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/models/current_weather_response_model.dart';
import 'package:laweather/widgets/air_pollution/air_pollution_detail_content_widget.dart';
import 'package:laweather/widgets/current_weather/bloc/current_weather_bloc.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/weather_description_widget.dart';
import 'package:laweather/widgets/global/weather_humidity_widget.dart';
import 'package:laweather/widgets/global/weather_image_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_high_low_widget.dart';
import 'package:laweather/widgets/global/weather_temperature_widget.dart';
import 'package:laweather/widgets/global/weather_wind_widget.dart';

part 'current_weather_detail_container_widget.dart';
part 'current_weather_detail_description_widget.dart';
part 'current_weather_detail_image_widget.dart';
part 'current_weather_detail_temperature_high_low_widget.dart';
part 'current_weather_detail_temperature_widget.dart';
part 'current_weather_detail_wind_widget.dart';
part 'current_weather_detail_humidity_widget.dart';

class CurrentWeatherDetailContentWidget extends StatelessWidget {
  const CurrentWeatherDetailContentWidget({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherLoadingState) {
          BlocProvider.of<CurrentWeatherBloc>(context)
              .add(GetWeatherByLocationEvent());
          return Column(
            children: [
              const SizedBox.shrink(),
              SizedBox(height: 32.h),
              const SizedBox.shrink(),
            ],
          );
        } else if (state is CurrentWeatherLoadedState) {
          return CurrentWeatherDetailContainerWidget(
              currentWeatherData: state.currentWeatherData);
        } else {
          return CustomErrorWidget(
              errorState: state as CurrentWeatherErrorState);
        }
      },
    );
  }
}
