import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/screens/current_weather_detail/bloc/current_weather_detail_bloc.dart';
import 'package:laweather/widgets/current_weather/current_weather_detail_content_widget.dart';
import 'package:laweather/widgets/history_weather/history_weather_detail_content_widget.dart';

class CurrentWeatherDetailScreen extends StatelessWidget {
  const CurrentWeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Weather',
          style: TextStyleConstant.headlineSmall(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<CurrentWeatherDetailBloc, CurrentWeatherDetailState>(
        builder: (context, state) {
          if (state is CurrentWeatherDetailLoadingState) {
            BlocProvider.of<CurrentWeatherDetailBloc>(context)
                .add(LoadCurrentWeatherDetailEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CurrentWeatherDetailLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CurrentWeatherDetailContentWidget(),
                    SizedBox(height: 16.h),
                    const HistoryWeatherDetailContentWidget(),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
