part of 'current_weather_detail_bloc.dart';

sealed class CurrentWeatherDetailEvent extends Equatable {
  const CurrentWeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrentWeatherDetailEvent extends CurrentWeatherDetailEvent {}
