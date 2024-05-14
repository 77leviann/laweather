part of 'forecast_by_days_bloc.dart';

sealed class ForecastByDaysState extends Equatable {
  const ForecastByDaysState();

  @override
  List<Object> get props => [];
}

class ForecastByDaysLoadingState extends ForecastByDaysState {}

class ForecastByDaysLoadedState extends ForecastByDaysState {
  final ForecastByDaysResponseModel forecastByDaysData;

  const ForecastByDaysLoadedState(this.forecastByDaysData);

  @override
  List<Object> get props => [forecastByDaysData];
}

class ForecastByDaysErrorState extends ForecastByDaysState {
  final String errorMessage;

  const ForecastByDaysErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
