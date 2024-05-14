import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:laweather/models/current_weather_response_model.dart';
import 'package:laweather/models/services/current_weather_service.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final WeatherService weatherService;

  CurrentWeatherBloc(this.weatherService) : super(CurrentWeatherLoadingState()) {
    on<GetWeatherByLocationEvent>((event, emit) async {
      await _handleWeatherByLocation(emit);
    });

    on<GetWeatherBySearchLocationEvent>((event, emit) async {
      await _handleWeatherBySearchLocation(event.location, emit);
    });
  }

  Future<void> _handleWeatherByLocation(
      Emitter<CurrentWeatherState> emit) async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(
        CurrentWeatherLoadedState(
          await _getWeatherByLocation(
            position.latitude.toString(),
            position.longitude.toString(),
          ),
        ),
      );
    } catch (e) {
      emit(
        CurrentWeatherErrorState('$e'),
      );
    }
  }

  Future<void> _handleWeatherBySearchLocation(
      String location, Emitter<CurrentWeatherState> emit) async {
    try {
      final weatherData =
          await WeatherService.getCurrentWeatherBySearchLocation(location);
      emit(
        CurrentWeatherLoadedState(weatherData),
      );
    } catch (e) {
      emit(
        CurrentWeatherErrorState('$e'),
      );
    }
  }

  Future<CurrentWeatherResponseModel> _getWeatherByLocation(
      String lat, String lon) async {
    return await WeatherService.getCurrentWeather(
      lat: lat,
      lon: lon,
    );
  }
}
