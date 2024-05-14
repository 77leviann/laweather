part of 'forecast_hourly_bloc.dart';

sealed class ForecastHourlyEvent extends Equatable {
  const ForecastHourlyEvent();

  @override
  List<Object?> get props => [];
}

class GetForecastHourlyEvent extends ForecastHourlyEvent {}