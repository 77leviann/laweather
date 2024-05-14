part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByLocationEvent extends CurrentWeatherEvent {}

class GetWeatherBySearchLocationEvent extends CurrentWeatherEvent {
  final String location;

  const GetWeatherBySearchLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}
