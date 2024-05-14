import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:laweather/models/history_weather_response_model.dart';
import 'package:laweather/models/services/history_weather_service.dart';

part 'history_weather_event.dart';
part 'history_weather_state.dart';

class HistoryWeatherBloc
    extends Bloc<HistoryWeatherEvent, HistoryWeatherState> {
  final HistoryWeatherService historyWeatherService;

  HistoryWeatherBloc(
    this.historyWeatherService,
  ) : super(HistoryWeatherLoading()) {
    on<GetHistoryWeatherEvent>((event, emit) async {
      await _handleHistoryWeatherByLocation(emit);
    });
  }

  Future<void> _handleHistoryWeatherByLocation(
      Emitter<HistoryWeatherState> emit) async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(
        HistoryWeatherLoaded(
          await _getHistoryWeatherLocation(
            position.latitude.toInt().toString(),
            position.longitude.toInt().toString(),
          ),
        ),
      );
    } catch (e) {
      emit(
        HistoryWeatherError('$e'),
      );
    }
  }

  Future<HistoryWeatherResponseModel> _getHistoryWeatherLocation(
    String lat,
    String lon,
  ) async {
    return await HistoryWeatherService.getHistoryWeather(
      lat: lat,
      lon: lon,
    );
  }
}
