import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'current_weather_detail_event.dart';
part 'current_weather_detail_state.dart';

class CurrentWeatherDetailBloc extends Bloc<LoadCurrentWeatherDetailEvent, CurrentWeatherDetailState> {
  CurrentWeatherDetailBloc() : super(CurrentWeatherDetailLoadingState()) {
    on<LoadCurrentWeatherDetailEvent>((event, emit) {
        emit(CurrentWeatherDetailLoadedState());
    });
  }
}
