import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laweather/models/current_weather_response_model.dart';
import 'package:laweather/models/services/current_weather_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherService weatherService;

  SearchBloc(this.weatherService) : super(SearchInitialState()) {
    on<GetWeatherBySearchLocationEvent>(_onGetWeatherBySearchLocation);
  }

  Future<void> _onGetWeatherBySearchLocation(
      GetWeatherBySearchLocationEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      final weatherData =
          await WeatherService.getCurrentWeatherBySearchLocation(
              event.location);
      emit(SearchSuccessState(weatherData));
    } catch (e) {
      emit(SearchFailedState('$e'));
    }
  }
}
