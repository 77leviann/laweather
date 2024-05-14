import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/helpers/string_format_helper.dart';
import 'package:laweather/screens/home/bloc/home_bloc.dart';
import 'package:laweather/widgets/current_weather/bloc/current_weather_bloc.dart';
import 'package:laweather/widgets/current_weather/current_weather_home_content_widget.dart';
import 'package:laweather/widgets/forecast/forecast_home_content_widget.dart';

part 'home_content_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(RequestLocationPermissionEvent());
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        String weatherDescription = state is CurrentWeatherLoadedState
            ? state.currentWeatherData.weather?.first.description ?? ""
            : "Loading...";
        return Scaffold(
          appBar: AppBar(
            title: Text(
              StringFormatHelper.capitalizeDescription(weatherDescription),
              style: TextStyleConstant.headlineSmall(context),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LocationPermissionGrantedState) {
                return const HomeContentWidget();
              } else if (state is LocationPermissionDeniedState) {
                return Text(
                  "Location permission denied!",
                  style: TextStyleConstant.errorStyle(context),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        );
      },
    );
  }
}
