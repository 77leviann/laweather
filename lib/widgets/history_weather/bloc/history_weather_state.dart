part of 'history_weather_bloc.dart';

sealed class HistoryWeatherState extends Equatable {
  const HistoryWeatherState();

  @override
  List<Object> get props => [];
}

class HistoryWeatherLoading extends HistoryWeatherState {}

class HistoryWeatherLoaded extends HistoryWeatherState {
  final HistoryWeatherResponseModel historyWeatherData;

  const HistoryWeatherLoaded(this.historyWeatherData);

  @override
  List<Object> get props => [historyWeatherData];
}

class HistoryWeatherError extends HistoryWeatherState {
  final String errorMessage;

  const HistoryWeatherError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
