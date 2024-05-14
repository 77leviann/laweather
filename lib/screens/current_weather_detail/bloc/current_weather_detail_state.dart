part of 'current_weather_detail_bloc.dart';

abstract class CurrentWeatherDetailState extends Equatable {
  const CurrentWeatherDetailState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherDetailLoadingState extends CurrentWeatherDetailState {}

class CurrentWeatherDetailLoadedState extends CurrentWeatherDetailState {}