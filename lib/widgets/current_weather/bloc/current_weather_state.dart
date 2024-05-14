part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object?> get props => [];
}

class CurrentWeatherLoadingState extends CurrentWeatherState {}

class CurrentWeatherLoadedState extends CurrentWeatherState {
  final CurrentWeatherResponseModel currentWeatherData;

  const CurrentWeatherLoadedState(this.currentWeatherData);

  @override
  List<Object?> get props => [currentWeatherData];
}

class CurrentWeatherErrorState extends CurrentWeatherState {
  final String errorMessage;

  const CurrentWeatherErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
