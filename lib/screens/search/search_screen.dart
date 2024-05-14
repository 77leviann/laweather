import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/screens/search/bloc/search_bloc.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/custom_search_bar_widget.dart';
import 'package:laweather/widgets/global/custom_search_location_list_tile_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomSearchBarWidget(
                          controller: locationController,
                          onSubmitted: (location) {
                            if (location.isNotEmpty) {
                              BlocProvider.of<SearchBloc>(context).add(
                                GetWeatherBySearchLocationEvent(location),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 16.h),
                        if (state is SearchLoadingState)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (state is SearchSuccessState)
                          CustomSearchLocationListTileWidget(
                            locationName: state.currentWeatherData.name ?? '',
                            locationCode:
                                state.currentWeatherData.sys?.country ?? '',
                            weatherDescription: state.currentWeatherData.weather
                                    ?.first.description ??
                                '',
                            temperature: state.currentWeatherData.main?.temp
                                    ?.toDouble() ??
                                0.0,
                          ),
                        if (state is SearchFailedState)
                          CustomErrorWidget(errorState: state),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
