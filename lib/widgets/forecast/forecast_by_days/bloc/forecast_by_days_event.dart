part of 'forecast_by_days_bloc.dart';

sealed class ForecastByDaysEvent extends Equatable {
  const ForecastByDaysEvent();

  @override
  List<Object?> get props => [];
}

class GetForecastByDaysEvent extends ForecastByDaysEvent {}