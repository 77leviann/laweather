part of 'history_weather_bloc.dart';
sealed class HistoryWeatherEvent extends Equatable {
  const HistoryWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryWeatherEvent extends HistoryWeatherEvent {}
